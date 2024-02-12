class UsersController < ApplicationController

  before_action :ideal_life_uncreated_user!
  before_action :mission_statement_created_user!,except: [:withdrawal,:destroy]

  def new
    @user = current_user
  end

  def confirm
    session[:mission_statement] = user_params[:mission_statement]
    session[:mission_detail] = user_params[:mission_detail]
    @user = current_user
  end

  def update
    if current_user.update(
      mission_statement: session[:mission_statement],
      mission_detail: session[:mission_detail],
      context: :create_mission_statement
      )
      redirect_to new_commit_path
    else
      render :confirm
    end
  end

  def withdrawal
  end

  def destroy
    current_user.destroy
    redirect_to root_path
  end

  private

    # ログインユーザーがidealテーブルとmission_statementのカラムを作成していない場合のアクセス制限
  def ideal_life_uncreated_user!
    if !current_user.ideal.present? && !current_user.mission_statement_present?
      redirect_to welcome_path
    end
  end

  def user_params
    params.require(:user).permit(:mission_statement,:mission_detail)
  end

end
