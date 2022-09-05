class Reservation < ApplicationRecord
  
  belongs_to :user
  belongs_to :hotel, optional: true
  
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :human, presence: true, numericality: true
  
 
end
