class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).where(user_id: current_user.id)
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
    if @booking.save && @booking.date >= Date.today
      redirect_to new_booking_charge_path(@booking)
    else
      booking_error
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

  def booking_error
    flash[:alert] = "Please choose a date in the future"
    redirect_to terrace_path(@terrace)
  end
end
