class Notification < ActiveRecord::Base
  attr_accessible :date
  
  belongs_to :user
  belongs_to :room_type
  
  validates :user_id, presence: true
  validates :room_type_id, presence: true
  validates :date, presence: true, uniqueness: { scope: [:user_id, :room_type_id] }
  validate :date_in_future
  
  scope :for_date, ->(date) { where(date: date) }
  
  def notify!
    Notifier.room_available(self).deliver
    destroy
  end
  
  private
  
  def date_in_future
    errors.add(:date, "can't be in the past") if date.present? && date < Date.today
  end
end
