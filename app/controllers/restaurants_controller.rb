class RestaurantsController < ApplicationController
	def index
	    respond_to do |format|
	      format.json {
	        @restaurants = Restaurant.all
	        render json: @restaurants
	      }
	    end
  	end

  	def restaurant_params
      params.require(:restaurant).permit(:name, :description, :telephone, :fb_url, :image, :owner_id)
    end
end