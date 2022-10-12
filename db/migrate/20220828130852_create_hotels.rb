class CreateHotels < ActiveRecord::Migration[6.1]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :hotel_introduction
      t.integer :hotel_price
      t.integer :hotel_address
      t.string :hotel_img
      t.integer :hotel_id

      t.timestamps
    end
  end
end
