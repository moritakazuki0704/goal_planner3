class Ideal < ApplicationRecord
  belongs_to :user

  enum ideal_status: { personality: 0, appearance: 1, lifestyle: 2, time: 3, working: 4, residence: 5, relationship: 6, partner: 7, role_model: 8 }
  
end
