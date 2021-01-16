require 'stripe'

class ChargesController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @terrace = @booking.terrace
    Stripe.api_key = ENV['SECRET_KEY']

    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @terrace.title
          },
          unit_amount: @terrace.price * 100
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: "https://terracerentals.herokuapp.com/bookings/#{@booking.id}/confirmation",
      cancel_url: "https://terracerentals.herokuapp.com/"
      # For now leave these URLs as placeholder values.
      #
      # Later on in the guide, you'll create a real success page, but no need to
      # do it yet.
    })
    @booking.update(checkout_session_id: @session.id)
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @terrace = @booking.terrace
  end
end
