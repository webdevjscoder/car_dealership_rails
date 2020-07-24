class Review < ApplicationRecord
    belongs_to :vehicle
    belongs_to :user
    validates :comment, presence: true
end