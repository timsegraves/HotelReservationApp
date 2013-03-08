class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :user, null: false
      t.references :room_type, null: false
      t.date :date, null: false
      t.timestamps
    end
    add_index :notifications, [:room_type_id, :user_id, :date], unique: true
  end
end
