class Hotel < ApplicationRecord
  
  mount_uploader :hotel_img, ImageUploader
  belongs_to :reservation, optional: true
  belongs_to :user


  def self.search(area)
       Hotel.where(['hotel_addres LIKE ?', "%#{area}%"]) 
  end 
   
  def self.search(key)
       Hotel.where(['hotel_name LIKE ? OR hotel_addres LIKE ? OR hotel_price LIKE ?', "%#{key}%", "%#{key}%", "%#{key}%"]) 
  end
   $$
  
end
