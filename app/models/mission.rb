class Mission < ApplicationRecord
  belongs_to :user

  enum schedule_status: { goal: 0, plan: 1 }

end
