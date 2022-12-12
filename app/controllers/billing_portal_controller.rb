class BillingPortalController < ApplicationController
    require 'stripe'
    Stripe.api_key = 'sk_test_51M2nVEAUWd5BoaTvArJWvqQ4qi3HQ1hNekOT9x3jI6Tc7RFCnpgaKlEDN1laIB6nToh9rZbHX3GUl6yB43APQ6Xd007vdPIAGj'
  
    #create a billing portal for the current user
    def create
        @portal_session = Stripe::BillingPortal::Session.create({
            customer: current_user.stripe_customer_id,
            return_url: root_url,
            # return_url: 'http://localhost:3000/episodes'
        })
        redirect_to @portal_session.url
    end

end

