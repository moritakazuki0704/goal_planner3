class CommitsController < ApplicationController

  before_action :not_design_your_ideal_life!

  def new
    @commit = Commit.new
  end

  def confirm
    session[:commitment] = commit_params[:commitment]
    session[:purpose] = commit_params[:purpose]
    @commit = Commit.new
  end

  def create
    commit = Commit.new(
      commitment: session[:commitment],
      purpose: session[:purpose]
      )
    commit.user_id = current_user.id

    # 初回にcommitテーブルを作成した場合
    if !current_user.commits.present?
      commit.save
      redirect_to commit_path(commit.id)

    # commitテーブルをすでに持っている場合
    else
      commit.save
      redirect_to welcome_path
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

  # ログインユーザーがidealテーブルとmission_statementのカラムを作成していない場合のアクセス制限
  def not_design_your_ideal_life!
    if !current_user.ideal.present? && !current_user.mission_statement.present?
      redirect_to welcome_path
    end
  end

  def commit_params
    params.require(:commit).permit(:commitment,:purpose,:progress_stetas)
  end

end