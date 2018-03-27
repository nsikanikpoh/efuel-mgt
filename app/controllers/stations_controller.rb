class StationsController < ApplicationController
  before_action :set_station, only: [:newmanager, :newtank, :newproduct, :show, :edit, :update, :destroy]

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
   @reports = @station.sales_reports.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
   @pumps = @station.pumps.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
   @tanks = @station.tanks.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
   @stocks = @station.stocks.paginate(page: params[:page], per_page: 5).order(created_at: :desc, id: :desc)
 




  end

  # GET /stations/new
  def new
    @company = current_admin.company
     @station = @company.stations.build
  end

  # GET /stations/1/edit
  def edit
    @company = current_admin.company
     @station = @company.stations.find(params[:id])
  end

  def newproduct

  end

  def newmanager
    @company = current_admin.company
    #@station = Station.find(params[:station_id])
    @manager = @company.managers.build
  end
  
  

  
  # POST /stations
  # POST /stations.json
  def create
    @company = current_admin.company
    @zone = Zone.find(params[:zone_id])
    @station = @zone.stations.create(station_params)
    
    @station.company_id= @company.id
    #@company.station = @station

    @station.save
    respond_to do |format|
      if @station.save
        format.html { redirect_to @station, notice: 'Station was successfully created.' }
        format.json { render :show, status: :created, location: @station }
      else
        format.html { render :new }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stations/1
  # PATCH/PUT /stations/1.json
  def update
    @company = current_admin.company
     @station = @company.stations.find(params[:id])
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @company = current_admin.company
     @station = @company.stations.find(params[:id])
    @station.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name, :address, :state, :city, :company_id, :zone_id)
    end
end
