class BillingPortalController < ApplicationController
    require 'stripe'
    Stripe.api_key = 'sk_test_51M2nVEAUWd5BoaTvArJWvqQ4qi3HQ1hNekOT9x3jI6Tc7RFCnpgaKlEDN1laIB6nToh9rZbHX3GUl6yB43APQ6Xd007vdPIAGj'
  
    #create a billing portal for the current user
    def create  
        customer = Stripe::Customer.create()
        # update(stripe_customer_id: customer.id)
        portal_session = Stripe::BillingPortal::Session.create({ 
            customer: "cus_My08EBRWocQVAN",
            return_url: 'http://localhost:3000/users/'

        })
        redirect_to portal_session.url, allow_other_host: true
      end

end