class Motivation < ApplicationRecord
  belongs_to :user
  
  scope :positives, -> {where(motivation_stetas: 0)}
  scope :negatives, -> {where(motivation_stetas: 1)}
  scope :to_dos, -> {where(motivation_stetas: 2)}
  scope :wants, -> {where(motivation_stetas: 3)}
  
end