class Api::VotesController < ApplicationController
  respond_to :json

  def create
  	@vote = Vote.new(restaurant_id: params[:restaurant_id])
  	@vote.save
  	render json: @vote
  end

  def numberOfVotes
  	@vote = Vote.where(restaurant_id: params[:restaurant_id]).count
  	
  	render json: @vote  
  end

end
