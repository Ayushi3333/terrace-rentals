class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    @booking = Booking.new
    @terrace = Terrace.find(params[:terrace_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @terrace = Terrace.find(params[:terrace_id])
    @booking.terrace = @terrace
    @booking.user = current_user
    if @booking.save
      redirect_to new_booking_charge_path(@booking)
    else
      render :new
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @terrace = @booking.terrace
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
