class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
  end

  def about
    render('about')
  end

  def show
    @bikes = Bikes.find(params[:current_station_id])
  end
  
  
end
