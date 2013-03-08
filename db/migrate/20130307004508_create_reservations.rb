class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :room, null: false
      t.references :user, null: false
      t.date :date, null: false
      t.timestamps
    end
    add_index :reservations, [:room_id, :date], unique: true
    add_index :reservations, [:user_id, :date]
  end
end
