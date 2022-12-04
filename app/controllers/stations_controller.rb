class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
    @bikes = Bike.all.order(identifier: :asc)
  end

  def show
    @bike = Bike.find(params[:current_station_id])
  end

  def GeoJSON
    @s = Station.all

    geojson = @s.map do |station|
      {
        "type": "Feature",
        "properties": {
            "name": station.name ,
            "address": station.address,
            "popupContent": "Change This Later"
        },
        "geometry": {
            "type": "Point",
            "coordinates": [station.longitude,station.latitude] 
        }
      }
    end
    render(json: geojson)
    return geojson
  end
  
end
