class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_room!, only: :create
  
  def index
    @reservations = current_user.reservations.by_date
  end
  
  def create
    date = params[:reservation][:date]
    
    if (reservation = @room_type.reserve(current_user, date))
      if reservation.persisted?
        redirect_to reservations_path, notice: "We've reserved your stay in #{reservation.room.name} on #{reservation.date}"
      else
        flash[:error] = reservation.friendly_error
        redirect_to room_path(@room_type)
      end
    else
      @room_type.notifications.create(date: date) { |notification| notification.user = current_user }
      flash[:error] = "#{@room_type.name} is sold out for that date, but we'll email you if it becomes available!"
      redirect_to room_path(@room_type)
    end
  end
  
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "Your reservation for #{@reservation.room.name} on #{@reservation.date} has been canceled."
  end
  
  private
  
  def find_room!
    @room_type = RoomType.find(params[:room_id])
  end
end
