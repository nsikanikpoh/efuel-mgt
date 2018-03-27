class ProductsController < ApplicationController
  before_action :set_product, only: [:newreport,:newpump, :show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @station = Station.find(@product.station_id)
    @stocks = @product.stocks.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
 
  end

  def newreport
    
  end

 def newtank
    #@product = Product.find(params[:id])

     @station = Station.find(@product.station_id)
    @tank = Tank.new
  end



    def newpump
     #@product = Product.find(params[:id])

     @station = Station.find(@product.station_id)
    
  end



  # GET /products/new
  def new
    
     @station = Station.find(params[:station_id])
     @product = @station.products.build
    
  end

 



  # GET /products/1/edit
  def edit
    
    
  end

  # POST /products
  # POST /products.json
  def create
    @station = Station.find(params[:station_id])
    @product = @station.products.build(product_params)
    @product.save
    respond_to do |format|
      if @product.save
        format.html { redirect_to @station, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
     
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
     @station = Station.find(params[:station_id])
     @product = @station.products.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :station_id)
    end
end
