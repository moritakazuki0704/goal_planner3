class IdealStepsController < ApplicationController
  include Wicked::Wizard
  steps :second, :third

  def new
    @ideal = Ideal.new
  end

  def create
    @ideal = Ideal.new(ideal_params)
    @ideal.ideal_status = 0
    @ideal.seve
    redirect_to ideal_steps_path
  end
end
