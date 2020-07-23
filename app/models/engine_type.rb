class EngineType < ApplicationRecord
    has_many :vehicles
    validates :name, presence: true, allow_blank: false
    validates :name, uniqueness: true
    validates :drive_line_id, presence: true
    validates :transmission_type_id, presence: true
end