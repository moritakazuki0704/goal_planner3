class SchedulesController < ApplicationController

  before_action :schedule_find,only: [:show,:edit,:update,:destroy]

  def new
    @schedule = Schedule.new
    @user_commit = current_user.commits
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to schedule_path(@schedule)
  end

  def index
    @schedules = current_user.schedules
  end

  def show
    @plan = Plan.new
  end

  def edit
  end

  def update
    @schedule.update(schedule_params)
    redirect_to schedule_path(@schedule)
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
    params.require(:schedule).permit(:title,:body,:start_time)
  end
end
