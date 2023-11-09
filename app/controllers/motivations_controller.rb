class MotivationsController < ApplicationController

  def new
  end

  def create
  end

  def index
    @motivations = current_user.motivations.all
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
