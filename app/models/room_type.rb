class RoomType < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  attr_accessible :name, :description, :photo, :beds, :bed_size, :handicapped_accessible, :non_smoking, :price
  
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :beds, presence: true, numericality: { greater_than: 0 }
  validates :bed_size, presence: true, inclusion: { in: %w(twin queen king) }
  validates :price, presence: true, numericality: { greater_than: 0 }
  
  # find a room matching this room type for the given date, and create a reservation for it
  def reserve(user, date)
    if (room = rooms.without_reservation(date).first)
      room.reserve(user, date)
    else
      false
    end
  end
  
  # track users who are interested in this room type becoming available for a given date
  def watch_availability(user, date)
    notifications.create(date: date) do |notification|
      notification.user = user
    end
  end
end
