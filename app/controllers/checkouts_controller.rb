class CheckoutsController < ApplicationController
    # before_action :authenticate_user!
    Stripe.api_key = 'sk_test_51MA2XxLFQu7F5KVbzeELWoGQJseEpJVj7iwsWWhquXTWdFenPsCJFcoCmUkKoDNMj6mFfHOpHv4bBiHXUtnYMRv9007TQg6Smz'
    skip_before_action :verify_authenticity_token
    YOUR_DOMAIN = 'http://localhost:3000'
    def create
        #content_type 'application/json'

        @session = Stripe::Checkout::Session.create({
        line_items: [{
      # Provide the exact Price ID (e.g. pr_1234) of the product you want to sell
            price: "price_1MDfulLFQu7F5KVb2uh5I0i5",
            quantity: 1,
        }],
        mode: 'payment',
        customer: current_user.stripe_customer_id,
        success_url: YOUR_DOMAIN + '/success.html.erb',
        cancel_url: YOUR_DOMAIN + '/cancel.html.erb',
        })
        #redirect session.url, 303
        redirect_to @session.url, allow_other_host: true
      end
    

      # <script async src="https://js.stripe.com/v3/pricing-table.js"></script>
      # <stripe-pricing-table pricing-table-id="prctbl_1MDg2VLFQu7F5KVbZPZcuvmn"
      # publishable-key="pk_test_51MA2XxLFQu7F5KVbUUT8HQHDbMbgfJsSaqb7QLQ7gOLY33S9HMp14v5C3oM977wz8im80V3wydrGUQAu4w4GcGjM001LEIYVEJ"
      # client-reference-id ="<%= current_user.stripe_customer_id %>">
      # </stripe-pricing-table>
      
    def show
      if logged_in?
        @bike = Bike.find(params[:id])
        @bike.in_use=true
        @bike.save
        @trip = Trip.new()
        @trip.trip_id=SecureRandom.base64(4).gsub("/","_").gsub(/=+$/,"")
        @trip.user_id=current_user.id
        @trip.bike_id= @bike.identifier
        @trip.start_station_id= @bike.current_station_id
        @trip.start_time =  Time.now
        
        if @trip.save
          redirect_to root_path
        end
      else
        flash[:warning]= "Please log in first."
        redirect_to sign_in_path
      end

    end

    def success

    end

end
