class Reservation < ActiveRecord::Base
  attr_accessible :date
  
  belongs_to :room
  belongs_to :user
  
  validates :room_id, presence: true
  validates :user_id, presence: true
  validates :date, presence: true, uniqueness: { scope: :room_id }
  validate :date_in_future
  
  scope :by_date, -> { order{date} }
  
  before_destroy :notify_available
  
  def friendly_error
    errors.messages.collect{ |k,v| "#{k} #{v.to_sentence}" }.to_sentence.capitalize
  end
  
  private
  
  def notify_available
    room.room_type.notifications.for_date(date).each(&:notify!)
  end
  
  def date_in_future
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
