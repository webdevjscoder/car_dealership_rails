class User < ApplicationRecord
    attr_accessor :skip_email_validation
    has_secure_password
    has_many :user_vehicles, :dependent => :destroy
    has_many :vehicles, through: :user_vehicles
    validates :email, presence: true, unless: -> { skip_email_validation }
    validates :email, uniqueness: true
    validates_confirmation_of :password
end
