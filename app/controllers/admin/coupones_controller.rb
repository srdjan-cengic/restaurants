class Admin::CouponesController < Admin::BaseController
  before_action :set_coupone, only: [:show, :edit, :update, :destroy]

  # GET /coupones
  # GET /coupones.json
  def index
    @coupones = Coupone.all
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
    @coupone = Coupone.new(coupone_params)

    respond_to do |format|
      if @coupone.save
        format.html { redirect_to admin_coupone_path(@coupone), notice: 'Coupone was successfully created.' }
        format.json { render action: 'show', status: :created, location: @coupone }
      else
        format.html { render action: 'new' }
        format.json { render json: @coupone.errors, status: :unprocessable_entity }
      end
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
      params.require(:coupone).permit(:description, :number_of_available, :restaurant_id)
    end
end
