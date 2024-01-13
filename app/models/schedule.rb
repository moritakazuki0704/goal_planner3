class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  has_many :plans,dependent: :destroy

end