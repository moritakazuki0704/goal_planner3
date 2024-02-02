class Plan < ApplicationRecord
  belongs_to :schedule

  enum priority_status: { emergency: 0, important: 1, mission: 2, eliminate: 3 }
  enum progress_status: { unstarted: 0, finish: 1, process: 2, postpone: 3, deletion: 4 }

  scope :memo, -> {where(programme: "false")}
  scope :programme, -> {where(programme: "true")}
  scope :emergency, -> {where(programme: "true", priority_status: 0)}
  scope :important, -> {where(programme: "true", priority_status: 1)}
  scope :mission, -> {where(programme: "true", priority_status: 2)}
  scope :eliminate, -> {where(programme: "true", priority_status: 3)}

end