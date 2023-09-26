class Schedule < ApplicationRecord
  belongs_to :user
  has_many :plans,dependent: :destroy

  enum schedule_status: { goal: 0, plan: 1 }


end
