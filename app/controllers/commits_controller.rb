class CommitsController < ApplicationController

  def new
    @commit = Commit.new
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
    @commit.save
    redirect_to commit_path(@commit.id)
  end

  def index
    user_commit = Commit.where(user_id: current_user)
    @commit_activity = user_commit.activity
    @commit_finish = user_commit.finish
  end

  def show
    @commit = Commit.find(params[:id])
    @mission = Mission.new
  end

  def update
    @commit = Commit.find(params[:id])
    @commit.update
    redirect_to commits_path
  end

  private

  def commit_params
    params.require(:commit).permit(:commitment,:purpose)
  end

end
