class User < ApplicationRecord
    attr_accessor :skip_email_validation

    has_secure_password
    has_many :user_vehicles
    has_many :vehicles, through: :user_vehicles
    validates :email, presence:{ message: 'is required.' }, unless: -> { skip_email_validation }
    validates :email, uniqueness: { message: 'already exists!' }
end
