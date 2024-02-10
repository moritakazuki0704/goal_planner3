class MissionsController < ApplicationController

  before_action :commit_find,only: [:create,:bulk_upload,:bulk_destroy]

  def create
    mission = Mission.new(mission_param)
    mission.commit_id = commit.id
    mission.save
    redirect_to commit_path(commit.id)
  end

  def upload
    mission = Mission.find(params[:id])

    # missionのデータをscheduleのテーブルに保存
    schedule = Schedule.new
    schedule.user_id = current_user.id
    schedule.commit_id = mission.commit_id
    schedule.title = mission.memo
    schedule.save

    # 保存が終わったmissionのデータを削除
    mission.destroy

    redirect_to commit_path(params[:commit_id])

  end

  def destroy
    mission = Mission.find(params[:id])
    mission.destroy
    redirect_to commit_path(params[:commit_id])
  end

  def bulk_upload

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

    redirect_to commit_path(params[commit.id])
  end

  def bulk_destroy
    mission = commit.missions
    mission.destroy_all
    redirect_to commit_path(commit.id)
  end

  private

  def commit_find
    commit = Commit.find(params[:commit_id])
  end

  def mission_params
    params.require(:mission).permit(:memo)
  end
end