class Motivation < ApplicationRecord
  belongs_to :user
  has_one :value,dependent: :destroy

  enum motivation_status: { positive: 0, negative: 1, unpleasant: 2, to_do: 3, want: 4 }

end
