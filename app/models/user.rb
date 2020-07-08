class User < ApplicationRecord
    has_secure_password
    has_many :user_vehicles
    has_many :vehicles, through: :user_vehicles
    validate :email_required?

    def email_required?
        if provider.blank?
            validates :email, presence:{ message: 'is required' }
            validates :email, uniqueness: { message: 'already exists!' }
        end
    end
    
end
