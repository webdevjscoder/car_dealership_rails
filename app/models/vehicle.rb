class Vehicle < ApplicationRecord
    belongs_to :car_make
    belongs_to :car_model
    belongs_to :engine_type
    belongs_to :fuel_type
    belongs_to :transmission
    belongs_to :engine
    has_many :inventories
    accepts_nested_attributes_for :inventories
    has_many :user_vehicles
    has_many :users, through: :user_vehicles
    validates_associated :inventories

    def self.save(upload, id)
        name = upload['datafile'].original_filename
        extension = name.split('.').last
        uuid = UUID.new
        new_filename = uuid.generate
        filename = new_filename + '.' + extension
        directory = Rails.root.join('app/assets/images/car-images').to_s
        # create the file path
        path = File.join(directory, filename)
        # write the file
        File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
        vehicle = self.find_by_id(id)
        vehicle.update(image: filename)
        vehicle.inventories[0].price.to_i
        vehicle.save
    end

    def self.images
        all.each do |image|
            image
        end
    end
end
