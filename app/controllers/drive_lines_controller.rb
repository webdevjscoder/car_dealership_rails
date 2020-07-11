class DriveLinesController < ApplicationController
    def new
        @drive_line = DriveLine.new
    end

    def create
        @drive_line = DriveLine.new(drive_line_params(:name))
    end

    private

    def drive_line_params(*args)
        params.require(:drive_line).permit(*args)
    end
end