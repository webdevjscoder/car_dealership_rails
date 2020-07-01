class User < ApplicationRecord
    has_secure_password
    has_many :customer_vehicles
    has_many :vehicles, through: :customer_vehicles
    validates :email, presence:{ message: 'is required' }
    validates :email, uniqueness: { message: 'already exists!' }
end
