class StockTanksController < ApplicationController
  before_action :set_stock_tank, only: [:show, :edit, :update, :destroy]

  # GET /stock_tanks
  # GET /stock_tanks.json
  def index
    @stock_tanks = StockTank.all
  end

  # GET /stock_tanks/1
  # GET /stock_tanks/1.json
  def show
    
  end

  # GET /stock_tanks/new
  def new
    @stock_tank = StockTank.new
  end

  # GET /stock_tanks/1/edit
  def edit

  end

  # POST /stock_tanks
  # POST /stock_tanks.json
  def create
    @stock = Stock.find(params[:stock_id])
    @stock_tank = StockTank.create(stock_tank_params)
    @stock.stock_tank = @stock_tank


    respond_to do |format|
      if @stock_tank.save
        format.html { redirect_to @stock_tank, notice: 'Stock tank was successfully created.' }
        format.json { render :show, status: :created, location: @stock_tank }
      else
        format.html { render :new }
        format.json { render json: @stock_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_tanks/1
  # PATCH/PUT /stock_tanks/1.json
  def update
    @stock = Stock.find(@stock_tank.stock_id)
    @stock_tank.sold_amount = @stock_tank.stock.selling_price_per_ltr * @stock_tank.sold_capacity

    respond_to do |format|
      if @stock_tank.update(stock_tank_params)
        format.html { redirect_to @stock_tank, notice: 'Stock tank was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_tank }
      else
        format.html { render :edit }
        format.json { render json: @stock_tank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_tanks/1
  # DELETE /stock_tanks/1.json
  def destroy
    @stock_tank.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Stock tank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_tank
      @stock_tank = StockTank.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_tank_params
      params.require(:stock_tank).permit(:stock_id, :stock_capacity, :sold_capacity, :sold_amount, :cost_price)
    end
end
