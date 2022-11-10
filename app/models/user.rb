class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates_presence_of    :username,
                             :first_name,
                             :last_name,
                             :password,
                             :email
                             :trip


    validates_uniqueness_of  :username

    has_many :trips
    has_many :comments
    has_many :payments

end