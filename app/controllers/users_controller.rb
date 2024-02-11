class UsersController < ApplicationController

  before_action :ideal_created_user!
  before_action :mission_statement_created_user!,except: [:withdrawal,:destroy]
  before_action :user_new, only: [:new,:confirm]

  def new
    @user = User.new
  end

  def confirm
    session[:mission_statement] = user_params[:mission_statement]
    session[:mission_detail] = user_params[:mission_detail]
    @user = User.new
  end

  def create
    user = User.new(
      mission_statement: session[:mission_statement],
      mission_detail: session[:mission_detail]
      )
    if user.save(context: :create_mission_statement)
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

  def user_new
    @motivation = Motivation.new
  end

  # ログインユーザーがuserテーブルのmission_statementのカラムを作成している場合のアクセス制限
  def mission_statement_created_user!
    if current_user.mission_statement.present?
      redirect_to welcome_path
    end
  end

    # ログインユーザーがidealテーブルを作成していない場合のアクセス制限
  def ideal_created_user!
    if current_user.ideal.present?
      redirect_to welcome_path
    end
  end

  def user_params
    params.require(:user).permit(:mission_statement,:mission_detail)
  end

end
