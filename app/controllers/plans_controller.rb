class PlansController < ApplicationController

  def create
    schedule = Schedule.find(params[:schedule_id])
    plan = Plan.new(plan_params)
    plan.schedule_id = schedule.id
    plan.save
    redirect_to schedule_path(schedule)
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(priority_status: 2)
    redirect_to schedule_path(params[:schedule_id])
  end

  def destroy
    plan = Plan.find(params[:id])
    plan.destroy
    redirect_to schedule_path(params[:schedule_id])
  end

  def all_update
    schedule = Schedule.find(params[:schedule_id])
    plan = schedule.plans.where(priority_status: 0)
    plan.update_all(priority_status: 2)
    redirect_to schedule_path(schedule)
  end

  def all_destroy
    schedule = Schedule.find(params[:schedule_id])
    plan = schedule.plans.where(priority_status: 0)
    plan.destroy_all
    redirect_to schedule_path(schedule)
  end

  private

  def plan_params
    params.require(:plan).permit(:task,:priority_status,:progress_status)
  end
end
