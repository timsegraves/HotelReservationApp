class Notifier < ActionMailer::Base
  include SendGrid
  
  default from: "matt@matthuggins.com"
  
  def room_available(notification)
    sendgrid_category "Room Available"
    
    @notification = notification
    
    mail to: notification.user.email,
         subject: "#{notification.room_type.name} is available on #{notification.date}"
  end
end
