class MotivationsController < ApplicationController

  # テキストテンプレートとフォームテンプレートのレンダーリンクをアクションにまとめるかどうか考える
  # まとめた場合、newアクションとlistアクションはbefore_actionで使用する

  def new
    @motivation = Motivation.new
  end

  def create
    @motivation = Motivation.new(motivation_params)
    @motivation.user_id = current_user.id
    @motivation.save
    if current_user.motivations.where(motivation_stetas: 1).present?
      redirect_to new_motivation_path
    elsif current_user.motivations.where(motivation_stetas: 2).present?
      redirect_to new_motivation_path
    elsif current_user.motivations.where(motivation_stetas: 3).present?
      redirect_to new_motivation_path
    else
      redirect_to list_motivations_path
    end
  end

  def index
    @motivations = current_user.motivations.order("RAND()").limit(5)
  end

  def list
    if params[:positive]
      @motivations = current_user.motivations.positives
    elsif params[:negative]
      @motivations = current_user.motivations.negatives
    elsif params[:to_do]
      @motivations = current_user.motivations.to_dos
    elsif params[:want]
      @motivations = current_user.motivations.wants
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

  def motivation_params
    params.require(:motivations).permit(:motivation_stetas,:motivation_title,:motivation,:motivation_memory)
  end

end