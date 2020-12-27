  
Rails.configuration.stripe = {
  publishable_key: ENV['PUBLISHABLE_KEY'],
  secret_key:      ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]


StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed', StripeCheckoutSessionService.new
end