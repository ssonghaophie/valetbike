class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    render('index')
  end

  def about
    render('about')
  end

  
  
end
