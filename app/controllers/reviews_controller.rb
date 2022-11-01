class ReviewsController < ApplicationController
  
    def index
      @reviews = Review.all.order(identifier: :asc)
    end
    
  end
  