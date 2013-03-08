class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number, null: false
      t.references :room_type, null: false
      t.timestamps
    end
    add_index :rooms, :number, unique: true
    add_index :rooms, :room_type_id
  end
end
