class Parking < ApplicationRecord

  belongs_to :car
  belongs_to :user
  
end
