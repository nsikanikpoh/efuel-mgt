class TanksController < ApplicationController
  before_action :set_tank, only: [:show, :edit, :update, :destroy]

  # GET /tanks
  # GET /tanks.json
  def index
    @tanks = Tank.all
  end

  # GET /tanks/1
  # GET /tanks/1.json
  def show
     @station = Station.find(@tank.product.station_id)
    
  end

  # GET /tanks/new
  def new
     
      @tank = Tank.new
   
  end

  # GET /tanks/1/edit
  def edit
   
  end

  # POST /tanks
  # POST /tanks.json
  def create
     @pump = Pump.find(params[:pump_id])
    #@product = Product.find(params[@pump.product_id])
    @product = @pump.product

    @tank = @product.tanks.create(tank_params)
    @tank.pump_id=@pump.id
    @tank.pump = @pump
    #@tank.product_id=@pump.product.id
    

    #@tank.station_id = @product.station.id
    @tank.used_capacity = 0

    @tank.free_capacity = @tank.total_capacity - @tank.used_capacity
    @tank.save


    respond_to do |format|
      if @tank.save
        format.html { redirect_to @tank, notice: 'Tank was successfully created.' }
        format.json { render :show, status: :created, location: @tank }
      else
        format.html { render :new }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tanks/1
  # PATCH/PUT /tanks/1.json
  def update
    if @tank.total_capacity != nil && @tank.used_capacity != nil
    @tank.free_capacity = @tank.total_capacity - @tank.used_capacity
    else
      redirect_to @tank, notice: 'You are trying to update emty values'
    end
     @tank.update(tank_params)
    respond_to do |format|
      if @tank.update(tank_params)
        format.html { redirect_to @tank, notice: 'Tank was successfully updated.' }
        format.json { render :show, status: :ok, location: @tank }
      else
        format.html { render :edit }
        format.json { render json: @tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tanks/1
  # DELETE /tanks/1.json
  def destroy
    
    @tank.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Tank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tank
      @tank = Tank.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tank_params
      params.require(:tank).permit(:pump_id, :product_id, :total_capacity, :used_capacity, :free_capacity)
    end
end
