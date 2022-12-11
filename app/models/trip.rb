class Trip < ApplicationRecord
    belongs_to :user
    validates_presence_of   :trip_id,
                            :start_station_id,
                            :user_id,
                            :bike_id
                            
                            
    
    validates_uniqueness_of  :trip_id
    has_one :amount, class_name: :Payment, foreign_key: :trip_id
end