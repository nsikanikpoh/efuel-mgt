class PumpsController < ApplicationController
  before_action :set_pump, only: [:newstock, :newtank, :show, :edit, :update, :destroy]

  # GET /pumps
  # GET /pumps.json
  def index
    @pumps = Pump.all
  end

  # GET /pumps/1
  # GET /pumps/1.json
  def show
  end

  # GET /pumps/new
  def new
     @product = Product.find(params[:product_id])
     @pump = @product.pumps.build
    
  end



  def newstock
     #@pump = Pump.find(params[:id])
     #@product = Product.find(@pump.product_id)
     #@station = Station.find(@pump.product.station_id)
     
  end

  def newtank
    #@pump = Pump.find(params[:id])
    @product = Product.find(@pump.product_id)
    @station = Station.find(@product.station_id)
    @tank = Tank.new
  end 

  # GET /pumps/1/edit
  def edit
   
  end

  # POST /pumps
  # POST /pumps.json
  def create
    @product = Product.find(params[:product_id])
    @station = Station.find(@product.station_id)
    #@stock.station = @station
     @pump = @product.pumps.build(pump_params)
     @pump.station = @station
     @pump.save
    respond_to do |format|
      if @pump.save
        format.html { redirect_to @product, notice: 'Pump was successfully created.' }
        format.json { render :show, status: :created, location: @pump }
      else
        format.html { render :new }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pumps/1
  # PATCH/PUT /pumps/1.json
  def update
   
     @pump.update(pump_params)
    respond_to do |format|
      if @pump.update(pump_params)
        format.html { redirect_to @pump, notice: 'Pump was successfully updated.' }
        format.json { render :show, status: :ok, location: @pump }
      else
        format.html { render :edit }
        format.json { render json: @pump.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pumps/1
  # DELETE /pumps/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @station = Station.find(@product.station_id)
     @pump = @product.pumps.find(params[:id])
    @pump.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Pump was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pump
      @pump = Pump.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pump_params
      params.require(:pump).permit(:name, :station_id, :product_id)
    end
end
