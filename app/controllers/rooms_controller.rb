class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new  
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:roomname, :roomprofile, :price, :address, :roomimage_id))
    if@room.save
      redirect_to @room
    else
      render "new"
    end
  end 
  
  
  
  def show
     @room = Room.find_by(id: params[:id])
    
  end

  
end
