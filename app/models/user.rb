# class User < ApplicationRecord
#     validates_presence_of    :first_name,
#                              :last_name,
#                              :username,
#                              :email,
#                              :password
                             
                             
#     # adds virtual attributes for authentication
#     has_secure_password
#     # validates email
#     validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

#     has_many :trips
#     has_many :comments
#     has_many :payments
    
#     has_secure_password

# end
class User < ApplicationRecord
    # adds virtual attributes for authentication
    has_secure_password
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
 end