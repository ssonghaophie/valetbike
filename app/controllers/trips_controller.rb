class TripsController < ApplicationController

    #index of the trip
    def index
      @trips = Trip.all.order(identifier: :asc)
    end

    #show the trip observation with given parameters
    def show 
      @trip = Trip.find(params[:id])
      if @trip
        redirect_to trip_path
      else
        render('new')
    end
    
    #make new trip
    def new
      @count = Trip.count
      @trip = Trip.new(position: @count + 1)
    end
  
    #create new trip
    def create
      @trip = Trip.new(trip_params)
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
      if @trip.update(trip_params)
        redirect_to trip_path(@trip)
      else
        render('edit')
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
        :tripId,
        :status,
        :startTime,
        :endTime,
        :startStation,
        :endStation,
        :date,
        :review,
        :description
      )
    end



  end
  