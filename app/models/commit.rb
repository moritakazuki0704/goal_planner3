class Commit < ApplicationRecord
  belongs_to :user
  has_many :missions,dependent: :destroy
  has_many :schedules,dependent: :destroy

  enum progress_stetas: { process: 0, finish: 1, pending: 2 }

  validates :progress_stetas, presence: true,numericality: {only_integer: true, greater_than_or_equal_to: 0},inclusion: { in: 0..2 }
  with_options presence: true do
    validates :commitment
    validates :purpose
  end


  scope :activity, -> {where(progress_stetas: 0)}
  scope :finish, -> {where(progress_stetas: 1)}
  scope :pending, -> {where(progress_stetas: 2)}

end
