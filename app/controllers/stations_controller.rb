class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    
  end

  def show
    @station = Station.find_by(params[:identifier])
    redirect_to @station
  end

  def GeoJSON
    @s = Station.all

    geojson = @s.map do |station|
      {
        "type": "Feature",
        "properties": {
            "name": station.name ,
            "address": station.address,
            "available_bikes": "111"
        },
        "geometry": {
            "type": "Point",
            "coordinates": [station.latitude,station.longitude] 
        }
      }
    end
    render(json: geojson)
    return geojson
  end
  
end
