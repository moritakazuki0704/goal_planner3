class ScrapBook < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :comment, presence: true

end
