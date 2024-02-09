class SchedulesController < ApplicationController

  before_action :schedule_find,only: [:show,:edit,:update,:destroy]

  def new
    @schedule = Schedule.new
    @user_commit = current_user.commits.activity.order(created_at: :desc)
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save(context: :create_schedule)
    redirect_to schedule_path(@schedule.id)
  end

  def index
    @schedules = Schedule.where(user_id: current_user)
  end

  def show
    @plan = Plan.new
  end

  def edit
    @user_commit = Commit.where(user_id: current_user)
  end

  def update
    @schedule.update(schedule_params)
    redirect_to schedule_path(@schedule.id)
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  def schedule_find
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:commit_id,:title,:body,:start,:end)
  end
end
