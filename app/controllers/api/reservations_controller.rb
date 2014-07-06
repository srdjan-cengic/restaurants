class Api::ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_filter :reservation_params, only: [:create, :update]
  
  # GET /coupones
  # GET /coupones.json
 
  respond_to :json, :xml, :html

 
  # POST /coupones
  # POST /coupones.json
  def create
    respond_to do |format|
        #The bang versions (e.g. save!) raise an exception if the record is invalid.
        random_string = SecureRandom.hex
        code = random_string.to_json;
        reservation = Reservation.new(@permitted)
        reservation.code =  random_string

        if reservation.save!
          format.json  { render :json => code }
        else
          format.json { render json: reservation.errors, status: :unprocessable_entity }
        end
    end
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params 
      @permitted = params.require(:reservation).permit(:id, :user_id, :coupone_id)
    end
end
