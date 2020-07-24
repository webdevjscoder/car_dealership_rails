class ReviewsController < ApplicationController
    before_action :new_review, only: [:new, :create]
    before_action :find_vehicle_by_id, only: [:index, :new]

    def index
        @reviews = Review.all
    end
    
    def new
        render :layout => 'forms'
    end

    def create
        @review = Review.new(review_params(:vehicle_id, :user_id, :comment))
        @review.user_id = current_user.id
        if @review.save
            flash[:notice] = "Successfully added review!"
            redirect_to create_review_vehicle_path(@review.vehicle_id)
        else
            render :new
        end
    end

    def edit
        @review = Review.find_by_id(params[:review][:id])
        @vehicle = Vehicle.find_by_id(params[:id])
        render :layout => 'forms'
    end

    def update
        review = Review.find_by_id(params[:id])
        review.update(review_params(:comment))
        review.save
        redirect_to create_review_vehicle_path(review.vehicle.id)
    end

    def destroy
        Review.find_by_id(params[:id]).destroy
        flash[:notice] = "Successfully deleted!"
        redirect_to create_review_vehicle_path(params[:review][:vehicle_id])
    end

    private

    def review_params(*args)
        params.require(:review).permit(*args)
    end

    def new_review
        @review = Review.new
    end

    def find_vehicle_by_id
        @vehicle = Vehicle.find_by_id(params[:id])
    end
end
