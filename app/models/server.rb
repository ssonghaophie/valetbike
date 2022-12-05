require 'stripe'
require 'sinatra'

# This is your test secret API key.
Stripe.api_key = 'sk_test_51M2nVEAUWd5BoaTvArJWvqQ4qi3HQ1hNekOT9x3jI6Tc7RFCnpgaKlEDN1laIB6nToh9rZbHX3GUl6yB43APQ6Xd007vdPIAGj'

set :static, true
set :port, 3000

YOUR_DOMAIN = 'http://localhost:3000'

post '/create-checkout-session' do
  content_type 'application/json'

  session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
    line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
      price: 'price_1M6fT6AUWd5BoaTvwXfcNBzG',
      quantity: 1,
    }],
    mode: 'payment',
    success_url: YOUR_DOMAIN + 'app/views/checkouts/success.html.erb',
    cancel_url: YOUR_DOMAIN + 'app/views/checkouts/cancel.html.erb',
  })
#   redirect session.url, 303
end