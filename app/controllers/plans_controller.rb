class PlansController < ApplicationController

  before_action :schedule_find

  def create
    plan = Plan.new(plan_params)
    plan.schedule_id = schedule.id
    plan.save
    redirect_to schedule_path(schedule.id)
  end

  # 単一のplanテーブルを稼働させる
  def upload
    plan = Plan.find(params[:id])
    plan.update(programme: "true")
    redirect_to schedule_path(schedule.id)
  end

  # 単一のplanテーブルを削除する
  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to schedule_path(schedule.id)
  end

  # 複数のplanテーブルを稼働させる
  def bulk_upload
    plan = schedule.plans.where(programme: "false")
    plan.update_all(programme: "true")
    redirect_to schedule_path(schedule.id)
  end

  # 複数のplanテーブルを削除する
  def bulk_destroy
    plan = schedule.plans.where(programme: "false")
    plan.destroy_all
    redirect_to schedule_path(schedule.id)
  end

  # 複数のplanテーブルを更新する
  def all_update
    plan = schedule.plans.where(programme: "true")
    plan.update_all(plan_params)
    redirect_to schedule_path(schedule.id)
  end

  private

  def schedule_find
    schedule = Schedule.find(params[:schedule_id])
  end

  def plan_params
    params.require(:plan).permit(:task,:priority_status,:progress_status,:programme)
  end
end
