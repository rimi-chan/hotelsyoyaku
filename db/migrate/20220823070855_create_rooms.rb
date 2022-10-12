class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :roomname
      t.text :roomprofile
      t.integer :price
      t.string :address
      t.string :roomimage_id

      t.timestamps
    end
  end
end
