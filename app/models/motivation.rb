class Motivation < ApplicationRecord
  belongs_to :user

  enum stetas: { positive: 0, negative: 1, to_do: 2, want: 3 }

  validates :emotion_stetas,presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :appetite, uniqueness: { scope: :user }
  validates :memory, presence: true

  scope :positives, -> {where(emotion_stetas: 0)}
  scope :negatives, -> {where(emotion_stetas: 1)}
  scope :to_dos, -> {where(emotion_stetas: 2)}
  scope :wants, -> {where(emotion_stetas: 3)}


end