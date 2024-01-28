class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :commmit
  has_many :plans,dependent: :destroy

end