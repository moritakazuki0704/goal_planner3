class Form::PlanCollection < Form::Base
  FORM_COUNT = 10 #ここで、作成したい登録フォームの数を指定
  attr_accessor :plans

  def initialize(attributes = {})
    super attributes
    self.plans = FORM_COUNT.times.map { Plan.new() } unless self.plans.present?
  end

  # 上でsuper attributesとしているので必要
  def plans_attributes=(attributes)
    self.plans = attributes.map { |_, v| Plan.new(v) }
  end

  def save
    Plan.transaction do
      self.plans.map do |plan|
        if plan.availability # ここでチェックボックスにチェックを入れている商品のみが保存される
          goal = current_user.schedules.find_by(schedule_status: "goal")
          plan.schedule_id = goal.id
          plan.save
        end
      end
    end
    return true
      rescue => e
    return false
  end
end

