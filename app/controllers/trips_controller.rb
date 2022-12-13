class TripsController < ApplicationController
  require 'securerandom'
    #index of the trip
    def index
      @trips = Trip.all.order(identifier: :asc)
    end

    #show the trip observation with given parameters
    def show 
      @trip = Trip.find(params[:id])
    end
    
    #make new trip
    def new
      @count = Trip.count
      @trip = Trip.new(position: @count + 1)
    end
  
    #create new trip
    def create
      @trip = Trip.new(trip_params)
      @trip.trip_id=SecureRandom.base64(8).gsub("/","_").gsub(/=+$/,"")
      if @trip.save
        redirect_to trip_path
      else
        # The 'new' action is NOT being called here
        # Assign any instance variables needed
        # @count = Task.count
        render('new')
      end
    end
  
    def edit
      @trip = Trip.find(params[:id])
      #edit
    end
  
    def update
      @trip = Trip.find(params[:id])
      @trip.end_time=Time.now()
      @trip.end_station_id = :end_station_id
      @bike=Bike.find_by(identifier: @trip.bike_id)
      @bike.current_station_id=:end_station_id
      @bike.in_use=false
      if @trip.update(trip_params)
        flash[:success] = "Bike returned successfully"
        redirect_to root_path
      end
    end
  
    def delete
      @trip = Trip.find(params[:id])
      #delete
    end
  
    def destroy
      @trip = Trip.find(params[:id])
      @trip.destroy
      redirect_to trip_path
    end
  
  private
  
  def trip_params
    params.require(:trip).permit(
      :user_id,
      :trip_id,
      :bike_id,
      :start_time,
      :end_time,
      :start_station_id,
      :end_station_id
    )
  end
  end
  

  