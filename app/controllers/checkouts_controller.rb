class CheckoutsController < ApplicationController
    # before_action :authenticate_user!
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

        # membership = Membership.find(params[:id])
        # @session = Stripe::Checkout::Session.create({
        #   payment_method_types: ['card'],
        #   line_items: [{
        #     name: membership.name,
        #     amount: membership.price,
        #     currency: "usd",
        #     quantity: 1
        #   }],
        #   mode: 'payment',
        #   success_url: root_url,
        #   cancel_url: root_url,
        # })
        # respond_to do |format|
        #   format.js
        # end
      end

    def show
        
    #     current_user.processor = :stripe
    #     current_user.customer

    #     @checkout_session = current_user.payment_processor.checkout(
    #         mode: "payment",
    #         line_items: "price_1M6fT6AUWd5BoaTvwXfcNBzG"
    #     )

    #     current_user.set_payment_processor :stripe
    #     current_user.payment_processor.customer

    #    @checkout_session = current_user.payment_processor.checkout(
    #            mode: 'payment',
    #             #list of products
    #            line_items: 'price_1M6fT6AUWd5BoaTvwXfcNBzG',
    #         #    success_url: checkout_sucess_url,
    #        )
    end

    def success

    end

end
