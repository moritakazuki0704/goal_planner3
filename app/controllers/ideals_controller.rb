class IdealsController < ApplicationController

  def new
    @ideal = Ideal.new
  end

  def create
    @ideal = Ideal.new(ideal_params)
    @ideal.seve
    redirect_to ideal_steps_path
  end

  def show
  end

  def edit
  end
end
