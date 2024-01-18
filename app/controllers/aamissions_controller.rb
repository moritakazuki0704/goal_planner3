class MissionsController < ApplicationController

  def new
    @schedule = Schedule.new
    @form = Form::PlanCollection.new
    @mission = Mission.new
  end

  def create
    # 目標設定入力フォーム
    if params[:schedule]
      @schedule = Schedule.new(schedule_params)
      @schedule.user_id = current_user.id
      @schedule.schedule_status = "goal"
      @schedule.start_time = @schedule.created_at
      @schedule.save
      redirect_to new_mission_path(plan: "true")

    # ミッションステートメント入力フォーム
    elsif params[:mission]
      @mission = Mission.new(mission_params)
      @mission.user_id = current_user.id
      @mission.save
      redirect_to dash_board_path

    # 目標タスク入力フォーム
    else
      @form = Form::PlanCollection.new(plan_collection_params)
      @form.save
      redirect_to new_mission_path(mission: "true")

    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:title,:body,:start_time,:end_time)
  end

  def plan_collection_params
    params.require(:form_plan_collection).permit(plans_attributes: [:schedule_id, :task, :availability])
  end

  def mission_params
    params.require(:mission).permit(:mission_statement,:mission_detail)
  end

end