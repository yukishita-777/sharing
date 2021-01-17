class ReservationsController < ApplicationController
  
  def index
    @reservations = current_user.reservations
  end
  
  def new
    @reservation = Reservation.new
    @room = Room.find(params[:room_id])
    @reservation_start_day = params[:start_day]
    @reservation_finish_day = params[:finish_day]
    @reservation_number = params[:number]
  end

  def create
    if Reservation.create(reservation_params)
      flash[:notice] = "予約が完了しました。"
      redirect_to :root
    else
      render "new"
    end
  end

  def show
  end
  
  private
  def reservation_params
    params.permit(:start_day, :finish_day, :number, :room_id, :user_id).merge(user_id: current_user.id)
  end
end
