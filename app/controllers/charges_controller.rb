class ChargesController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @terrace = @booking.terrace

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'eur',
          product_data: {
            name: @terrace.title
          },
          unit_amount: @terrace.price
        },
        quantity: 1
      }],
      mode: 'payment',
      # For now leave these URLs as placeholder values.
      #
      # Later on in the guide, you'll create a real success page, but no need to
      # do it yet.
      success_url: confirmation_path(@booking),
      cancel_url: root_url
    })
    @booking.update(checkout_session_id: session.id)
  end
end
