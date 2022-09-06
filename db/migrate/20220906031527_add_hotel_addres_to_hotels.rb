class AddHotelAddresToHotels < ActiveRecord::Migration[6.1]
  def change
    add_column :hotels, :hotel_addres, :string
  end
end
