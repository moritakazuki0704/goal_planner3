class PlansController < ApplicationController

  def create
    schedule = Schedule.find(params[:schedule_id])
    plan = Plan.new(plan_params)
    plan.schedule_id = schedule.id
    plan.save
    redirect_to schedule_path(schedule)
  end

  def upload
    plan = Plan.find(params[:id])
    plan.update(programme: "true")
    redirect_to schedule_path(params[:schedule_id])
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to schedule_path(params[:schedule_id])
  end

  def bulk_upload
    schedule = Schedule.find(params[:schedule_id])
    plan = schedule.plans.where(programme: "false")
    plan.update_all(programme: "true")
    redirect_to schedule_path(schedule)
  end

  def bulk_destroy
    schedule = Schedule.find(params[:schedule_id])
    plan = schedule.plans.where(programme: "false")
    plan.destroy_all
    redirect_to schedule_path(schedule)
  end
  
  def all_update
    schedule = Schedule.find(params[:schedule_id])
    plan = schedule.plans.where(programme: "true")
    plan.update_all(plan_params)
    redirect_to schedule_path(schedule)
  end

  private

  def plan_params
    params.require(:plan).permit(:task,:priority_status,:progress_status,:programme)
  end
end
