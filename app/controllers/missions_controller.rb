class MissionsController < ApplicationController

  def new
    @schedule = Schedule.new
    @plan = Plan.new
    @mission = Mission.new
  end

  def create
    # 目標設定入力フォーム
    if params[:mission]
      @schedule = Schedule.new(mission_params)
      @schedule.user_id = current_user.id
      @schedule.schedule_status = "goal"
      @scedule.save
      redirect_to new_mission_path(plan: "true")

    # 目標タスク入力フォーム
    elsif params[:plan]
      @plan = Plan.new(plan_params)
      @plan =
      redirect_to new_mission_path(mission: "true")

    # ミッションステートメント入力フォーム
    elsif params[:mission]
      @mission = Mission.new(mission_params)
      @mission.user_id = current_user.id
      @mission.save
      redirect_to dash_board_path
    end
  end

end