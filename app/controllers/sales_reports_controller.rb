class SalesReportsController < ApplicationController
  before_action :set_sales_report, only: [:show, :edit, :update, :destroy]

  # GET /sales_reports
  # GET /sales_reports.json
  def index
    @sales_reports = SalesReport.all
  end

  # GET /sales_reports/1
  # GET /sales_reports/1.json
  def show
  end

  # GET /sales_reports/new
  def new
    @product = Product.find(params[:product_id])
     @sales_report = @product.sales_reports.build
  end

  # GET /sales_reports/1/edit
  def edit
    @sales_report = SalesReport.find(params[:id])
    @product = @sales_report.product
    @sales_report = @product.sales_reports.find(params[:id])
  end

@carry_over = 0
@carry_over2 = 0

  def fixbalance(stock)
      @wests =[] 
            unless stock.stock_tank.stock_capacity == stock.stock_tank.sold_capacity
              
              @carry_over = stock.stock_tank.stock_capacity - stock.stock_tank.sold_capacity
              unless @carry_over2 == nil
                @carry_over += @carry_over2
              end
               if @sales_report.sold_capacity <= @carry_over

                 stock.stock_tank.update(sold_capacity: stock.stock_tank.sold_capacity + @sales_report.sold_capacity)
              
                 stock.stock_tank.update(sold_amount: stock.stock_tank.sold_capacity * @sales_report.cost_price)
              
                
               elsif @sales_report.sold_capacity > @carry_over
                  @carry_over2 = @sales_report.sold_capacity - @carry_over
                  stock.stock_tank.update(sold_capacity: stock.stock_tank.sold_capacity + @carry_over)
                  stock.stock_tank.update(sold_amount: stock.stock_tank.sold_capacity * @sales_report.cost_price)
                  unless @carry_over1 == nil
                    @carry_over2 -= @carry_over1
                  end
                  @carry_over = 0
              (@wets ||= []).push(stock)
              end
          end 
  end
  # POST /sales_reports
  # POST /sales_reports.json
  def create
   # @sales_report = SalesReport.new(sales_report_params)
    #@pump = Pump.find(params[:pump_id])
    @product = Product.find(params[:product_id])

    @sales_report = @product.sales_reports.build(sales_report_params)
    #@tank.product=@product.id

    @sales_report.sold_capacity = @sales_report.met_at_reading - @sales_report.left_at_reading
    @sales_report.estimate_amount = @sales_report.cost_price * @sales_report.sold_capacity
    @sales_report.track  =  @sales_report.amount_brought - @sales_report.estimate_amount

    if @sales_report.estimate_amount == @sales_report.amount_brought
        @sales_report.remark = 0
    elsif @sales_report.estimate_amount < @sales_report.amount_brought
        @sales_report.remark = 2
    elsif @sales_report.estimate_amount > @sales_report.amount_brought
         @sales_report.remark = 1
    else
       @sales_report.remark = 3
    end
    
    @sales_report.station_id = @product.station.id

    @admin = current_admin
    @sales_report.admin_id= @admin.id
    @sales_report.admin = @admin
   
   @sales_report.save
    respond_to do |format|
 if @sales_report.save
        @sales_report.pump.tank.update(used_capacity:   @sales_report.pump.tank.used_capacity - @sales_report.sold_capacity)
      @sales_report.pump.tank.update(free_capacity: @sales_report.pump.tank.total_capacity - @sales_report.pump.tank.used_capacity)
      @stocks =  @sales_report.pump.stocks #Stock.all
      
      @stocks.each do |stock|
        

        if stock
          if @wests.blank?
              fixbalance(stock)

         elsif @wests.include?(stock)
              
         else   
            fixbalance(stock)
          
        
      
      end
       end
    end

       format.html { redirect_to @sales_report, notice: 'Sales report was successfully created.' }
        format.json { render :show, status: :created, location: @sales_report }
      else
        format.html { render :new }
        format.json { render json: @sales_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_reports/1
  # PATCH/PUT /sales_reports/1.json
  def update
    @sales_report = SalesReport.find(params[:id])
    @product = @sales_report.product
    @sales_report = @product.sales_reports.find(params[:id])

      @sales_report.sold_capacity = @sales_report.met_at_reading - @sales_report.left_at_reading
    @sales_report.estimate_amount = @sales_report.cost_price * @sales_report.sold_capacity
    @sales_report.track  = @sales_report.amount_brought - @sales_report.estimate_amount 

    if @sales_report.estimate_amount == @sales_report.amount_brought
        @sales_report.remark = 0
    elsif @sales_report.estimate_amount > @sales_report.amount_brought
        @sales_report.remark = 1
    elsif @sales_report.estimate_amount < @sales_report.amount_brought
         @sales_report.remark = 2
    else
       @sales_report.remark = 3
    end
     @capacity = @sales_report.pump.tank.used_capacity - @sales_report.sold_capacity
   
    respond_to do |format|
      if @sales_report.update(sales_report_params)
         @sales_report.pump.tank.update(used_capacity: @capacity)

        format.html { redirect_to @sales_report, notice: 'Sales report was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_report }
      else
        format.html { render :edit }
        format.json { render json: @sales_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_reports/1
  # DELETE /sales_reports/1.json
  def destroy

    @sales_report = SalesReport.find(params[:id])
    @product = @sales_report.product
     @sales_report = @product.sales_reports.find(params[:id])
    @sales_report.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Sales report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_report
      @sales_report = SalesReport.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_report_params
      params.require(:sales_report).permit(:admin_id, :track, :cost_price, :pump_id, :station_id, :product_id, :pump_attendant_name, :pump_attendat_phone, :met_at_reading, :left_at_reading, :sold_capacity, :estimate_amount, :amount_brought, :remark)
    end
end
