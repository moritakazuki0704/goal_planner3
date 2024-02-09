class CommitsController < ApplicationController

  def new
    @commit = Commit.new
    @ideal = Ideal.find_by(user_id: current_user)
  end

  def confirm
    session[:commitment] = commit_params[:commmitment]
    session[:purpose] = commit_params[:purpose]
    @commit = Commit.new
  end

  def create
    @commit = Commit.new(
      commitment: session[:commitment],
      purpose: session[:purpose]
      )
    @commit.user_id = current_user.id
    if @commit.save
      redirect_to welcome_path
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
    @commit = Commit.find(params[:id])
    @commit.update(commit_params)
    redirect_to commits_path
  end

  private

  def commit_params
    params.require(:commit).permit(:commitment,:purpose,:progress_stetas)
  end

end
