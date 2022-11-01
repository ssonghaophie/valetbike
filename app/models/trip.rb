class Trip < ApplicationRecord
    belongs_to :user
    validates_presence_of   :identifier,
                            :status,
                            :startStation,
                            :endStation,
                            :date
                            
  
    validates_uniqueness_of  :identifier
    has_one :amount, class_name: :Payment, foreign_key: :trip_id
end