class Plan < ApplicationRecord
  belongs_to :schedule

  enum priority_status: { emergency: 0, important: 1, mission: 2, eliminate: 3 }
  enum progress_status: { unstarted: 0, finish: 1, process: 2, postpone: 3, withdraw: 4 }

  validates :task, presence: true
  with_options presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0} do
    validates :priority_status, inclusion: { in: 0..3 }
    validates :progress_status, inclusion: { in: 0..4 }
  end

  # メモ状態のタスクを表示
  scope :memo, -> {where(programme: "false")}
  # ToDoリストにしたタスクを表示
  scope :programme, -> {where(programme: "true")}
  # ToDoリストにしたステータスが大事なことのタスクを表示
  scope :emergency, -> {where(programme: "true", priority_status: 0)}
  # ToDoリストにしたステータスが重要なことのタスクを表示
  scope :important, -> {where(programme: "true", priority_status: 1)}
  # ToDoリストにしたステータスがやるべきことのタスクを表示
  scope :mission, -> {where(programme: "true", priority_status: 2)}
  # ToDoリストにしたステータスが辞めることのタスクを表示
  scope :eliminate, -> {where(programme: "true", priority_status: 3)}

end