class ZonalmanagersController < ApplicationController
  before_action :set_zonalmanager, only: [:show, :edit, :update, :destroy]

  # GET /zonalmanagers
  # GET /zonalmanagers.json
  def index
    @zonalmanagers = Zonalmanager.all
  end

  # GET /zonalmanagers/1
  # GET /zonalmanagers/1.json
  def show
  end

  # GET /zonalmanagers/new
  def new
    @company = current_admin.company
     @zonalmanager = @company.zonalmanagers.build
  end

  # GET /zonalmanagers/1/edit
  def edit
    
  end

  # POST /zonalmanagers
  # POST /zonalmanagers.json
  def create
    @company = current_admin.company
    @zone = Zone.find(params[:zone_id])
    @zonalmanager = @zone.zonalmanagers.create(zonalmanager_params)
    @zonalmanager.company_id= @company.id
    @zonalmanager.save
    respond_to do |format|
      if @zonalmanager.save
        format.html { redirect_to @zonalmanager, notice: 'zonalmanager was successfully created.' }
        format.json { render :show, status: :created, location: @zonalmanager }
      else
        format.html { render :new }
        format.json { render json: @zonalmanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zonalmanagers/1
  # PATCH/PUT /zonalmanagers/1.json
  def update
    
    respond_to do |format|
      if @zonalmanager.update(zonalmanager_params)
        format.html { redirect_to @zonalmanager, notice: 'zonalmanager was successfully updated.' }
        format.json { render :show, status: :ok, location: @zonalmanager }
      else
        format.html { render :edit }
        format.json { render json: @zonalmanager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zonalmanagers/1
  # DELETE /zonalmanagers/1.json
  def destroy
    @company = current_admin.company
     @zonalmanager = @company.zonalmanagers.find(params[:id])
    @zonalmanager.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'zonalmanager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zonalmanager
      @zonalmanager = Zonalmanager.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zonalmanager_params
      params.require(:zonalmanager).permit(:type, :email, :password, :company_id, :fname, :lname, :address, :phone, :city, :state)
    end 
end
