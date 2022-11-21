class User < ApplicationRecord
    # adds virtual attributes for authentication
    has_secure_password
    # validates email
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    
    PASSWORD_FORMAT = /\A
        (?=.{8,})          # Must contain 8 or more characters
        (?=.*\d)           # Must contain a digit
        (?=.*[a-z])        # Must contain a lower case character
        (?=.*[A-Z])        # Must contain an upper case character
        (?=.*[[:^alnum:]]) # Must contain a symbol
    /x
    validates :password, 
        presence: true, length: { in: 8..20 }, 
        format: { with: PASSWORD_FORMAT }, 
        confirmation: true, 
        on: :create 

    #pay_customer stripe_attributes: :stripe_attributes
    pay_customer stripe_attributes: ->(pay_customer) { metadata: { { user_id: pay_customer.owner_id } } }
    def stripe_attributes(pay_customer)
        {
            address: {
                city: pay_customer.owner.city,
                country: pay_customer.owner.country
            },
            metadata: {
                pay_customer_id: pay_customer.id,
                user_id: id #or pay_cumstomer.owner_id
            }
        }
    end

end