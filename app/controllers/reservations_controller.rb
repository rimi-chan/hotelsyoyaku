class ReservationsController < ApplicationController


before_action :authenticate_user!, except: [:index] 


  def index
     @reservations = current_user.reservations.order(updated_at: 'DESC')
  end
  
   def confirm
    @reservation = Reservation.new(reservation_params)
    @hotel = Hotel.find(params[:hotel_id])
    render template: 'hotels/show' and return if @reservation.invalid?
     @days = (@reservation.end_date - @reservation.start_date).to_i
    @prices = @days * @hotel.hotel_price * @reservation.human
    
    if @days <= 0
      flash[:alert] = "開始日より後にしてください"
      redirect_to @hotel 
  
    elsif @reservation.human <=0 
        flash[:alert] = "正しい人数を入力してください"
        redirect_to @hotel
    end
   end

   def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "You made a reservation"
      redirect_to @reservation
    else
      render "confirm"
    end
   
   end
   
   def show
  
    @reservation = Reservation.find(params[:id])
     @days = (@reservation.end_date - @reservation.start_date).to_i
   end


  private
  
  def reservation_params
    params.permit(:start_date, :end_date, :human, :hotel_id,:hotel_price,:hotel_name).merge(user_id: current_user.id)
  end


end