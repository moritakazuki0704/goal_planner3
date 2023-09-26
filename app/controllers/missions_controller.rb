class MissionsController < ApplicationController

  def new
    @schedule = Schedule.new
    @plan = Plan.new
    @mission = Mission.new
  end

  def create
  end

end
