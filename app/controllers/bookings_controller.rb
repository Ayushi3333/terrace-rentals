class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    @terrace = Terrace.find(params[:terrace_id])
  end

  def create
    @terrace = Terrace.find(params[:terrace_id])
    if booking_valid
      @booking = Booking.new(booking_params)
      @booking.terrace = @terrace
      @booking.user = current_user
      if @booking.save && @booking.date >= Date.today
        redirect_to new_booking_charge_path(@booking)
      else
        booking_error
      end
    else
      flash[:alert] = "You cannot book your own terrace"
      redirect_to terrace_path(@terrace)
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
    @terrace = @booking.terrace
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = "Accepted"
    @booking.save
    flash[:notice] = "You accepted the booking!"
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end

  def booking_error
    flash[:alert] = "Please choose a date in the future"
    redirect_to terrace_path(@terrace)
  end

  def booking_valid
    Terrace.find(params[:terrace_id]).user_id != current_user.id
  end
end
