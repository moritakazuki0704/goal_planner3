class IdealsController < ApplicationController

  def new
    @ideal = Ideal.new
  end

  def create
    @ideal = Ideal.new(ideal_params)
    @ideal.user_id = current_user.id

    # <!--理想の性格入力フォーム-->
    if params[:ideal][:ideal_section] == "0"
      @ideal.ideal_status = "personality"
      @ideal.save
      redirect_to new_ideal_path(appearance: "true")

    # <!--理想の姿入力フォーム-->
    elsif params[:ideal][:ideal_section] == "1"
      @ideal.ideal_status = "appearance"
      @ideal.save
      redirect_to new_ideal_path(lifestyle: "true")

    # <!--理想のライフスタイル入力フォーム-->
    elsif params[:ideal][:ideal_section] == "2"
      @ideal.ideal_status = "lifestyle"
      @ideal.save
      redirect_to new_ideal_path(time: "true")

    # <!--理想の時間入力フォーム-->
    elsif params[:ideal][:ideal_section] == "3"
      @ideal.ideal_status = "time"
      @ideal.save
      redirect_to new_ideal_path(working: "true")

    # <!--理想の働き方入力フォーム-->
    elsif params[:ideal][:ideal_section] == "4"
      @ideal.ideal_status = "working"
      @ideal.save
      redirect_to new_ideal_path(residence: "true")

    # <!--理想の住まい入力フォーム-->
    elsif params[:ideal][:ideal_section] == "5"
      @ideal.ideal_status = "residence"
      @ideal.save
      redirect_to new_ideal_path(relationship: "true")

    # <!--理想の人間関係入力フォーム-->
    elsif params[:ideal][:ideal_section] == "6"
      @ideal.ideal_status = "relationship"
      @ideal.save
      redirect_to new_ideal_path(partner: "true")

    # <!--理想のパートナー入力フォーム-->
    elsif params[:ideal][:ideal_section] == "7"
      @ideal.ideal_status = "partner"
      @ideal.save
      redirect_to new_ideal_path(model: "true")

    # <!--理想のロールモデル入力フォーム-->
    elsif params[:ideal][:ideal_section] == "8"
      @ideal.ideal_status = "model"
      @ideal.save
      redirect_to dash_board_path
    end
  end

  def index
  end

  def edit
  end
  
  def update
  end

  private

  def ideal_params
    params.require(:ideal).permit(:ideal_status,:text_1,:text_2,:text_3)
  end

end