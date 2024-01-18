class MissionsController < ApplicationController

  def new
    @mission = Mission.new
  end

  def confirm
    session[:mission_statement] = mission_params[:mission_statement]
    session[:mission_detail] = mission_params[:mission_detail]
    @mission = Mission.new
  end

  def create
    @mission = Mission.new(
      mission_statement: session[:mission_statement],
      mission_detail: session[:mission_detail]
      )
    @mission.user_id = current_user.id
    @mission.save
    redirect_to new_detail_mission_path
  end

  def new_detail
  end

  def show
    @mission = current_user.missions
  end

  private

  def mission_params
    params.require(:mission).permit(:mission_statement,:mission_detail)
  end

end