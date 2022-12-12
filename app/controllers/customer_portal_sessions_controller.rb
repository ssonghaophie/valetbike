class CustomerPortalSessionsController < ApplicationController
    require 'stripe'
    Stripe.api_key = 'sk_test_51MA2XxLFQu7F5KVbzeELWoGQJseEpJVj7iwsWWhquXTWdFenPsCJFcoCmUkKoDNMj6mFfHOpHv4bBiHXUtnYMRv9007TQg6Smz'

    def create
        portal_session = Stripe::BillingPortal::Session.create(
          customer: current_user.stripe_customer_id,
          return_url: root_url
        )
        redirect_to portal_session.url
    end
end
