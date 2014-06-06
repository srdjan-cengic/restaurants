class Api::CouponesController < ApplicationController
  before_action :set_coupone, only: [:show, :edit, :update, :destroy]
  #before_filter :coupone_params, only: [:create, :update]
  
  # GET /coupones
  # GET /coupones.json
 
  respond_to :json, :xml

  def index
    respond_to do |format|
      format.any(:json, :xml) {
        coupones = Coupone.all

      if coupones.empty? 
        head :not_found
        return
      end

      respond_with coupones, status: :ok
      }
    end
  end

  # GET /coupones/1
  # GET /coupones/1.json
  def show
  end

  # GET /coupones/new
  def new
    @coupone = Coupone.new
  end

  # GET /coupones/1/edit
  def edit
  end

  # POST /coupones
  # POST /coupones.json
  def create
    @coupon = Coupone.new(coupone_params)

    if @coupon.save
      respond_with @coupon, status: 201, location: api_coupone_url(@coupon)
    else
      @errors = @coupon.errors.full_messages # Array stringova
      render json: @errors, status: 422
    end
  end

  # PATCH/PUT /coupones/1
  # PATCH/PUT /coupones/1.json
  def update
    respond_to do |format|
      if @coupone.update(coupone_params)
        format.html { redirect_to admin_coupone_path(@coupone), notice: 'Coupone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @coupone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coupones/1
  # DELETE /coupones/1.json
  def destroy
    @coupone.destroy
    respond_to do |format|
      format.html { redirect_to admin_coupones_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coupone
      @coupone = Coupone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coupone_params
      @permitted = params.require(:coupone).permit(:id, :description, :number_of_available, :restaurant_id, :available_from, :ends_at)
    end
end
