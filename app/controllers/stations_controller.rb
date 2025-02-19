class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    
  end

  def show
    @stations = Station.find_by(identifier: params[:identifier])
    @bikes = Bike.where(current_station_id: @stations.identifier)
    
  end

  def GeoJSON
    @s = Station.all

    geojson = @s.map do |station|
      {
        "type": "Feature",
        "properties": {
            "name": station.name ,
            "address": station.address,
            "identifier": station.identifier
        },
        "geometry": {
            "type": "Point",
            "coordinates": [station.latitude, station.longitude] 
        }
      }
    end
    render(json: geojson)
    return geojson
  end
  
end
