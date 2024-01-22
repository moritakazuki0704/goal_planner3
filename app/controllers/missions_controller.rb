class MissionsController < ApplicationController

  def new
    @mission = Mission.new
  end

  def confirm
    session[:goal] = mission_params[:goal]
    session[:purpose] = mission_params[:purpose]
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(
      goal: session[:goal],
      purpose: session[:purpose]
      )
    @mission.user_id = current_user.id
    @mission.save
    redirect_to new_detail_mission_path
  end

  def detail_new
  end
  
  def index
    @mission = current_user.missions
  end

  def show
    @mission = current_user.missions
  end

  private

  def mission_params
    params.require(:mission).permit(:goal,:purpose)
  end

end