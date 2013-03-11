class AddDaysToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :days, :integer, :default => 1
  end
end
