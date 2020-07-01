class User < ApplicationRecord
    has_secure_password
    validates :email, presence:{ message: 'is required' }
    validates :email, uniqueness: { message: 'already exists!' }
end
