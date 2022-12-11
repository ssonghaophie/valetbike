class MembershipController < ApplicationController

    # before_action :authenticate_user!
    Stripe.api_key = 'sk_test_51M2nVEAUWd5BoaTvArJWvqQ4qi3HQ1hNekOT9x3jI6Tc7RFCnpgaKlEDN1laIB6nToh9rZbHX3GUl6yB43APQ6Xd007vdPIAGj'
    # skip_before_action :verify_authenticity_token

    YOUR_DOMAIN = 'http://localhost:3000'


        
    def create
        # post '/create-checkout-session-membership' do
        #     prices = Stripe::Price.list(
        #       lookup_keys: [params['lookup_key']],
        #       expand: ['data.product']
        #     )
    
        @session = Stripe::Checkout::Session.create({
          mode: 'subscription',
          line_items: [{
            quantity: 1,
            price: 'price_1M6R3dAUWd5BoaTv4yxMB6Ks'
          }],
          success_url: YOUR_DOMAIN + '/success.html?session_id={CHECKOUT_SESSION_ID}',
          cancel_url: YOUR_DOMAIN + '/cancel.html',
        })
        rescue StandardError => e
          halt 400,
            { 'Content-Type' => 'application/json' },
            { 'error': { message: e.error.message } }.to_json
        
        redirect_to @session.url, 303
    end
        # redirect_to @session.url, allow_other_host: true
  
    # end

    
    
    def show

    end

end   
