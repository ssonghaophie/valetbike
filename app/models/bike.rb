class Bike < ApplicationRecord
  validates_presence_of    :identifier
  validates_uniqueness_of  :identifier

  # belongs_to :station, class_name: :Station, foreign_key: :current_station_id, optional: true
  
  belongs_to :current_station, class_name: :Station, foreign_key: :current_station_id, primary_key: :identifier, optional: true

end
