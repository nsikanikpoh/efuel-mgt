class ManagersController < ApplicationController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]

  # GET /managers
  # GET /managers.json
  def index
    @managers = Manager.all
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
  end

  # GET /managers/new
  def new
    @company = current_admin.company
    @station = Station.find(params[:station_id])
    @manager = @company.managers.build
  end

  # GET /managers/1/edit
  def edit
 
  end


  # POST /managers
  # POST /managers.json
  def create
    @company = current_admin.company
    @station = Station.find(params[:station_id])
    @manager = @station.managers.create(manager_params)
  
    @manager.company_id= @company.id
  #  @station.manager = @manager
    @manager.save
    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
     
     @manager.update(manager_params)
    respond_to do |format|
      if @manager.update(manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:fname, :lname,:email, :password,:address, :phone, :address, :station_id, :state, :city)
    end

end
