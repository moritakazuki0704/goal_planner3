class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def comfirm
    session[:mission_statement] = user_params[:mission_statement]
    session[:mission_detail] = user_params[:mission_detail]
    @user = User.new
  end

  def create
    @user = User.new(
      mission_statement: session[:mission_statement],
      mission_detail: session[:mission_detail]
      )
    @user.save
    redirect_to 
  end

  def dash_board
    @user = current_user
    @keywords = current_user.keywords.all
    @ideals = current_user.ideals.all
    @missions = current_user.missions.all
    @schedules = current_user.schedules.all
    @plans = Plan.all
    @missions = current_user.missions.all
  end

  def withdrawal
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:mission_statement,:mission_detail)
  end

end
