class Room < ApplicationRecord
  
  belongs_to :user
  mount_uploader :roomimage_id, ImageUploader
  

  has_many :reservations
  validates :roomname, presence: true
  validates :roomprofile, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true, numericality: true
end
