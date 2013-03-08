class CreateRoomTypes < ActiveRecord::Migration
  def change
    create_table :room_types do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :photo
      t.float :price, null: false
      t.integer :beds, null: false
      t.string :bed_size, null: false
      t.boolean :handicapped_accessible, null: false, default: false
      t.boolean :non_smoking, null: false, default: false
      t.timestamps
    end
    add_index :room_types, :name, unique: true
  end
end
