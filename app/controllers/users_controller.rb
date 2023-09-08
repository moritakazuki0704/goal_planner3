class UsersController < ApplicationController

  def dash_board
  end

  def withdrawal
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

end
