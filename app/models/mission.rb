class Mission < ApplicationRecord
  belongs_to :commit

  validates :memo, presence: true

end
