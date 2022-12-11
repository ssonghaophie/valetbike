class CheckoutsController < ApplicationController
    # before_action :authenticate_user!
    Stripe.api_key = 'sk_test_51M2nVEAUWd5BoaTvArJWvqQ4qi3HQ1hNekOT9x3jI6Tc7RFCnpgaKlEDN1laIB6nToh9rZbHX3GUl6yB43APQ6Xd007vdPIAGj'
    skip_before_action :verify_authenticity_token
    YOUR_DOMAIN = 'http://localhost:3000'
    def create
        #content_type 'application/json'

        @session = Stripe::Checkout::Session.create({
        line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
            price: 'price_1M6fT6AUWd5BoaTvwXfcNBzG',
            quantity: 1,
        }],
        mode: 'payment',
        success_url: YOUR_DOMAIN + '/success.html.erb',
        cancel_url: YOUR_DOMAIN + '/cancel.html.erb',
        })
        #redirect session.url, 303
        redirect_to @session.url, allow_other_host: true
      end
    

    def show

    end

    def success

    end

end
