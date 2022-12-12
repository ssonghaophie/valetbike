class ReviewsController < ApplicationController
  require 'securerandom'
    def index
      @reviews = Review.all.order(identifier: :asc)
    end
    
    def show
      @review = Review.find(params[:id])
    end
   
  
    def new
      @review = Review.new
      @review.save
    end

    def create
      @review = Review.new(review_params)
      @review.identifier=SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
      if @review.save 
        flash[:success] = "Thank you for infomation"
        redirect_to mytrip_path
      else
        redirect_to root_path
      end
    end

    private
  
  def review_params
    params.require(:review).
    permit(:comment);
    
  end

  end
  