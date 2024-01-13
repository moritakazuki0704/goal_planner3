class Mission < ApplicationRecord
  has_many :schedule, dependent: :destroy
  belongs_to :user
end
