class IdealsController < ApplicationController

  def new
    @ideal = Ideal.new
  end

  def create
    @ideal = Ideal.new(ideal_params)
    @ideal.ideal_status = 0
    @ideal.seve
    redirect_to ideal_steps_path
  end

  def show
  end

  def edit
  end

  private

  def ideal_params
    params.require(:ideal).permit(:text_1,:tect_2,:text_3)
  end

end