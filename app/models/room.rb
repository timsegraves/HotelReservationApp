class Room < ActiveRecord::Base
  attr_accessible :number
  
  belongs_to :room_type
  has_many :reservations, dependent: :destroy
  
  delegate :name, :photo, to: :room_type
  
  # find rooms that don't have a reservation for a given date
  scope :without_reservation, ->(date) do
    reserved_room_ids = joins{reservations.outer}.where(reservations: { date: date }).select{id}
    where{id.not_in(reserved_room_ids)}
  end
  
  def reserve(user, date)
    reservations.create(date: date) do |reservation|
      reservation.user = user
    end
  end
end
