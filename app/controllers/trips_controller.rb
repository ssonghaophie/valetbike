class TripsController < ApplicationController
  
    def index
      @trips = Trip.all.order(identifier: :asc)
    end
    
  end
  