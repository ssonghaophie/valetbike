class CheckoutsController < ApplicationController
#before_action :authenticate_user!

    def show
        #current_user.set_payment_processor :stripe
        #current_user.payment_processor.customer

       # @checkout_session = current_user.payment_processor.checkout(
        #        mode: 'payment',
                #list of products
         #       line_items: 'price_1M6fT6AUWd5BoaTvwXfcNBzG',
          #      success_url: checkout_sucess_url,
           # )
    end

    def success

    end

end
