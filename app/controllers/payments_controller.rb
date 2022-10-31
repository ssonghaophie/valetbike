class PaymentsController < ApplicationController
  
    def index
      @payments = Payment.all.order(identifier: :asc)
    end
    
  end
  