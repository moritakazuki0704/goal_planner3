class Commit < ApplicationRecord
  belongs_to :user
  has_many :missions,dependent: :destroy

  scope :activity, -> {where(finish: false)}
  scope :finish, -> {where(finish: true)}

end
