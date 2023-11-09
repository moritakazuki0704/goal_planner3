class Motivation < ApplicationRecord
  belongs_to :user
  has_one :value,dependent: :destroy

  enum motivation_status: { positive: 0, negative: 1, to_do: 2, want: 3 }

end
