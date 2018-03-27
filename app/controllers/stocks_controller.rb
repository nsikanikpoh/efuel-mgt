class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.all
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
  end

  # GET /stocks/new
  def new
    @pump = Pump.find(params[:pump_id])
     @stock = @pump.stocks.build
    
  end

  # GET /stocks/1/edit
  def edit
   
    
  end


def create_stock_tank(stock)
  
    StockTank.create(stock_id: stock.id,
                        stock_capacity: stock.tank_capacity,
                        sold_capacity: 0,
                  sold_amount: 0,
                        cost_price: stock.cost_price)
end


  # POST /stocks
  # POST /stocks.json
  def create
     @pump = Pump.find(params[:pump_id])
     
   

    @product = @pump.product
    @station = @product.station
    #@stock.station = @station
     @stock = @pump.stocks.build(stock_params)
     @stock.product = @product
     @stock.station = @station
 if @stock.tank_capacity <= @pump.tank.free_capacity
 
     @stock.cost_price = @stock.tank_capacity * @stock.cost_per_ltr

     
     @stock.estimated_sales_price =  @stock.tank_capacity * @stock.selling_price_per_ltr
     
     @stock.estimate_profit = @stock.estimated_sales_price - @stock.cost_price


     @stock.estimate_profit_percent = (@stock.estimate_profit / @stock.estimated_sales_price) * 100
     


     @stock.save


   respond_to do |format|
      if @stock.save
        create_stock_tank @stock
        @pump.tank.update(used_capacity: @pump.tank.used_capacity + @stock.tank_capacity )
          @pump.tank.update(free_capacity: @pump.tank.total_capacity - @pump.tank.used_capacity)

      format.html { redirect_to @pump, notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end

  else 
    redirect_to newstock_pump_path(@pump), notice: 'Your New Stock Tank capacity must be less than or equal to the current pump tank capacity to avoid spillage. Stock was not entered.'

  end

  end

  # PATCH/PUT /stocks/1
  # PATCH/PUT /stocks/1.json
  def update
   @pump = Pump.find(params[:pump_id])
    @product = @pump.product
    @station = Station.find(@pump.product.station_id)
     @stock = @pump.stocks.find(params[:id])
       @stock.cost_price = @stock.tank_capacity * @stock.cost_per_ltr

     
     @stock.estimated_sales_price =  @stock.tank_capacity * @stock.selling_price_per_ltr
     
     @stock.estimate_profit = @stock.estimated_sales_price - @stock.cost_price


     @stock.estimate_profit_percent = (@stock.estimate_profit / @stock.estimated_sales_price) * 100
      @capacity = @product.tank.used_capacity + @stock.tank_capacity

     @stock.update(stock_params)
    respond_to do |format|
      if @stock.update(stock_params)
        create_stock_tank @stock
        @pump.tank.update(used_capacity: @capacity)

        format.html { redirect_to @stock, notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1
  # DELETE /stocks/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @station = Station.find(@product.station_id)
     @stock = @product.stocks.find(params[:id])
     @stock.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_params
      params.require(:stock).permit(:description, :station_id, :tank_capacity,:pump_id, :product_id, :supplier, :cost_price, :cost_per_ltr, :selling_price_per_ltr, :estimated_sales_price, :estimate_profit_percent, :estimate_profit)
    end
end