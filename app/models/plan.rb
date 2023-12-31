class Plan < ApplicationRecord
  belongs_to :schedule

  enum priority_status: { emergency: 0, important: 1, mission: 2 }
  enum progress_status: { start: 0, finish: 1, process: 2, postpone: 3, cancel: 4 }

  with_options presence: true do
    validates :schedule_id
    validates :task
    validates :availability, inclusion: { in: [true, false] }
  end

end