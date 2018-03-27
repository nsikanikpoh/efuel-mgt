class ZonesController < ApplicationController
  before_action :set_zone, only: [:newzonalmanager,:newstation,:show, :edit, :update, :destroy]

  # GET /zones
  # GET /zones.json
  def index
    @zones = Zone.all
  end

  # GET /zones/1
  # GET /zones/1.json
  def show

  end

  def newstation
    @company = current_admin.company
    #@station = Station.find(params[:station_id])
    @station = @company.stations.build
  end


  def newzonalmanager
    @company = current_admin.company
    #@station = Station.find(params[:station_id])
    @zonalmanager = @company.zonalmanagers.build
  end

  # GET /zones/new
  def new
    @company = current_admin.company
     @zone = @company.zones.build
  end

  # GET /zones/1/edit
  def edit
 
  end

  # POST /zones
  # POST /zones.json
  def create
    @company = current_admin.company
    @zone = @company.zones.create(zone_params)
    @zone.save
    respond_to do |format|
      if @zone.save
        format.html { redirect_to @zone, notice: 'Zone was successfully created.' }
        format.json { render :show, status: :created, location: @zone }
      else
        format.html { render :new }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zones/1
  # PATCH/PUT /zones/1.json
  def update
    
    respond_to do |format|
      if @zone.update(zone_params)
        format.html { redirect_to @zone, notice: 'Zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @zone }
      else
        format.html { render :edit }
        format.json { render json: @zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zones/1
  # DELETE /zones/1.json
  def destroy
    
    @zone.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone
      @zone = Zone.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zone_params
      params.require(:zone).permit(:name, :state, :company)
    end
end
