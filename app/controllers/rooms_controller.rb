class RoomsController < ApplicationController
  before_filter :authenticate_user!, only: :reserve
  
  def index
    @room_types = RoomType.all
  end
  
  def show
    @room_type = RoomType.find(params[:id])
  end
end
