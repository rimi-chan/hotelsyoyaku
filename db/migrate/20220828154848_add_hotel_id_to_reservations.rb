class AddHotelIdToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :hotel_id, :string
  end
end
