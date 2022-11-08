class User < ApplicationRecord
    validates_presence_of    :first_name,
                             :last_name,
                             :username,
                             :email,
                             :password
                             
                             


    validates_uniqueness_of  :username

    has_many :trips
    has_many :comments
    has_many :payments
    
    has_secure_password
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
end