class MotivationsController < ApplicationController

  before_action :motivation_find, except: [:show,:destroy]

  def new
    @motivation = Motivation.new
  end

  def create
    @motivation = Motivation.new(motivation_params)
    @motivation.user_id = current_user.id
    @motivation.save
    if @user_motivation.where(motivation_stetas: 1).present?
      redirect_to new_motivation_path
    elsif @user_motivation.where(motivation_stetas: 2).present?
      redirect_to new_motivation_path
    elsif @user_motivation.where(motivation_stetas: 3).present?
      redirect_to new_motivation_path
    else
      redirect_to list_motivations_path
    end
  end

  def index
    @motivations = @user_motivation.order("RANDOM()").limit(5)
  end

  def list
    if params[:positive]
      @motivations = @user_motivation.positives
    elsif params[:negative]
      @motivations = @user_motivation.negatives
    elsif params[:to_do]
      @motivations = @user_motivation.to_dos
    elsif params[:want]
      @motivations = @user_motivation.wants
    end
  end

  def show
    @motivation = Motivation.find(params[:id])
  end

  def destroy
    @motivation = Motivation.find(params[:id])
    @motivation.destroy
    redirect_to list_motivations_path
  end

  private

  def motivation_find
    @user_motivation = Motivation.where(user_id: current_user)
  end

  def motivation_params
    params.require(:motivation).permit(:emotion_stetas,:appetite,:memory)
  end

end

