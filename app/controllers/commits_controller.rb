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
    @commit.save
    redirect_to welcome_path
  end

  def index
    @commit = current_user.commits.where(finish: "false")
    @commit_finish = current_user.commits.where(finish: "true")
  end

  def show
    @commit = Commit.find(params[:id])
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
