class WelcomeController < ApplicationController
  def index
    @stations = Station.all.order(identifier: :asc)
    @review = Review.new
  end

  def about
    render ('about')
  end
  def service
    render ('service')
    
  end
  
end
