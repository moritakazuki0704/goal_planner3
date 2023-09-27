class UsersController < ApplicationController

  def dash_board
    @user = current_user
    @keywords = current_user.keywords.all
    @ideals = current_user.ideals.all
    @missions = current_user.missions.all
    @schedules = current_user.schedules.all
  end

  def withdrawal
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

end
