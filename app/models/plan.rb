class Plan < ApplicationRecord
  belongs_to :schedule

  enum priority_status: { proposal: 0, emergency: 1, important: 2, mission: 3, eliminate: 4 }
  enum progress_status: { unstarted: 0, finish: 1, process: 2, postpone: 3 }
end