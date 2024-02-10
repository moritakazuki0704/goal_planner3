class MissionsController < ApplicationController

  before_action :mission_statement_uncreated_user!

  def create
    commit = Commit.find(params[:commit_id])
    mission = Mission.new(mission_param)
    mission.commit_id = commit.id
    if mission.save
      redirect_to commit_path(commit.id)
    else
      render template: 'commit/show'
    end
  end

  # 単一のmissionテーブルをscheduleに保存する
  def upload
    commit = Commit.find(params[:commit_id])
    mission = Mission.find(params[:id])

    # missionのデータをscheduleのテーブルに保存
    schedule = Schedule.new
    schedule.user_id = current_user.id
    schedule.commit_id = mission.commit_id
    schedule.title = mission.memo
    schedule.save

    # 保存が終わったmissionのデータを削除
    mission.destroy

    redirect_to commit_path(commit.id)

  end

  # 単一のmissionテーブルを削除する
  def destroy
    commit = Commit.find(params[:commit_id])
    mission = Mission.find(params[:id])
    mission.destroy
    redirect_to commit_path(commit.id)
  end

  # 複数のmissionテーブルをscheduleに保存する
  def bulk_upload
    commit = Commit.find(params[:commit_id])

    # 閲覧中のcommitが保持しているmissionのデータをscheduleのテーブルに保存
    commit.missions.each do |mission|
      schedule = Schedule.new
      schedule.user_id = current_user.id
      schedule.commit_id = mission.commit_id
      schedule.title = mission.memo
      schedule.save
    end

    # 閲覧中のcommitが保持しているmissionのデータを全て削除
    commit.missions.destroy_all

    redirect_to commit_path(commit.id)
  end

  # 複数のmissionテーブルを削除する
  def bulk_destroy
    commit = Commit.find(params[:commit_id])
    mission = commit.missions
    mission.destroy_all
    redirect_to commit_path(commit.id)
  end

  private

  def mission_params
    params.require(:mission).permit(:memo)
  end
end