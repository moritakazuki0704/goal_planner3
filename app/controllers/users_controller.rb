class UsersController < ApplicationController

  def dash_board
    @keyword = Keyword.find_by(user_id: current_user.id)
  end

  def withdrawal
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

end
