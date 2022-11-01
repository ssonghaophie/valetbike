class Comment < ApplicationRecord
    belongs_to :user
    validates_presence_of    :identifier,
                             :comment
                             :rating
                        
    validates_uniqueness_of  :identifier
    
   
end
  