class Payment < ApplicationRecord
    validates_presence_of    :identifier,
                             :username,
                             :card_no,
                             :amount
                             :trip_id
    validates_uniqueness_of  :identifier
    
    has_one :username, class_name: :User, foreign_key: :username
    
end