class Plan < ApplicationRecord
  belongs_to :schedule

  enum priority_status: { proposal: 0, emergency: 1, important: 2, mission: 3, eliminate: 4 }
  enum progress_status: { unstarted: 0, finish: 1, process: 2, postpone: 3, deletion: 4 }
  
  scope :emergency, -> {where(priority_status: 1)}
  scope :important, -> {where(priority_status: 2)}
  scope :mission, -> {where(priority_status: 3)}
  scope :eliminate, -> {where(priority_status: 4)}
  
end