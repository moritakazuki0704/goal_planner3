class MissionsController < ApplicationController

  def new
    @mission = Mission.new
  end

  def new_detail
    session[:mission_statement] = mission_params[:mission_statement]
    session[:mission_detail] = mission_params[:mission_detail]
    @mission = Mission.new
  end

  def confirm
    session[]
  end

  def create
  end

  def show
  end

  private
  
  def mission_params
    params.require(:mission).permit(:mission_statement,:mission_detail)
  end

end