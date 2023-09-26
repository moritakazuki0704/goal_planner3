class KeywordsController < ApplicationController
  
  def introduction
  end

  def new
    @keyword = Keyword.new
  end

  def create
    @keyword = Keyword.new(keyword_params)
    @keyword.user_id = current_user.id
    @keyword.save
    redirect_to new_ideal_path(personality: "true")
  end

  private

  def keyword_params
    params.require(:keyword).permit(:keyword_1,:keyword_2,:keyword_3,:keyword_4,:keyword_5,:keyword_6,:keyword_7,:keyword_8,:keyword_9,:keyword_10)
  end
end