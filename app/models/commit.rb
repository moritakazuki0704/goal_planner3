class Commit < ApplicationRecord
  belongs_to :user
  has_many :missions,dependent: :destroy
  has_many :schedules,dependent: :destroy

  enum progress_stetas: { process: 0, finish: 1, pending: 2 }

  scope :activity, -> {where(progress_stetas: "0")}
  scope :finish, -> {where(progress_stetas: "1")}

end
