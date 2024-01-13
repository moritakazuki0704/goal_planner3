class MotivationsController < ApplicationController

  before_action :set_motivation,except: [:create]

  def new
    @motivation = Motivation.new
  end

  def create
    @motivation = Motivation.new(motivation_params)
    @motivation.user_id = current_user.id
    @motivation.save
    redirect_to  motivation_path
  end

  def show
  end

  def edit
  end

  def update
    @motivation.update
    redirect_to  motivation_path
  end

  private

  def set_motivation
    @user_motivation = current_user.motivations
  end

  def motivation_params
    params.require(:motivations).permit(:positive_motivation_1,:positive_motivation_2,:positive_motivation_3,:positive_motivation_4,:positive_motivation_5,:negative_motivation_1,:negative_motivation_2,:negative_motivation_3,:negative_motivation_4,:negative_motivation_5,:to_do_motivation_1,:to_do_motivation_2,:to_do_motivation_3,:to_do_motivation_4,:to_do_motivation_5,:want_motivation_1,:want_motivation_2,:want_motivation_3,:want_motivation_4,:want_motivation_5)
  end

end