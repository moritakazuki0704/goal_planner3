class CommitsController < ApplicationController

  before_action :ideal_created_user!
  before_action :mission_statement_uncreated_user!
  before_action :commit_new, except: [:new,:confirm]

  def new
    @ideal = Ideal.find_by(user_id: current_user)
  end

  def confirm
    session[:commitment] = commit_params[:commmitment]
    session[:purpose] = commit_params[:purpose]
  end

  def create
    commit = Commit.new(
      commitment: session[:commitment],
      purpose: session[:purpose]
      )
    commit.user_id = current_user.id

    if commit.save
      # ログインユーザーがcommitテーブルを持っている場合
      if !current_user.commits.present?
        redirect_to welcome_path
      else
        # ログインユーザーがcommitテーブルを持っていない場合
        redirect_to commit_path(commit.id)
      end

    else
      render :confirm
    end
  end

  def index
    @commits = Commit.where(user_id: current_user)
  end

  def show
    @commit = Commit.find(params[:id])
    @mission = Mission.new
  end

  def update
    commit = Commit.find(params[:id])
    commit.update(commit_params)
    redirect_to commit_path(commit.id)
  end

  private

  def commit_new
    @commit = Commit.new
  end

    # ログインユーザーがuserテーブルのmission_statementのカラムを作成していない場合のアクセス制限
  def mission_statement_uncreated_user!
    if !current_user.mission_statement.present?
      redirect_to welcome_path
    end
  end

    # ログインユーザーがidealテーブルを作成していない場合のアクセス制限
  def ideal_created_user!
    if current_user.ideal.present?
      redirect_to welcome_path
    end
  end

  def commit_params
    params.require(:commit).permit(:commitment,:purpose,:progress_stetas)
  end

end
