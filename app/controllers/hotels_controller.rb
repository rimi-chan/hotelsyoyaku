class HotelsController < ApplicationController
  
  before_action :authenticate_user!, except: [:show, :search]
  
  def index
   @hotels = Hotel.all.order(updated_at: 'ASC').page(params[:page]).per(8)
  end
  
  def new
   @hotel = Hotel.new
  end
  
  def create
    @hotel = Hotel.new(params.require(:hotel).permit(:hotel_name, :hotel_introduction, :hotel_price, :hotel_addres, :hotel_img ))
    @hotel.user = current_user
    if @hotel.save
     
      redirect_to @hotel
    else
      render"new"
    end
  end
  
  def show
    @hotel = Hotel.find(params[:id])
  end
  
   def search
    @area = params[:area]
    @key = params[:key]
    if @area != nil 
     @hotels = Hotel.search(params[:area])
    elsif @key != nil 
     @hotels = Hotel.search(params[:key])
    else
     @hotels = Hotel.all
    end
  end
  
end
