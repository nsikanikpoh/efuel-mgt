class CompanyadminsController < ApplicationController
  skip_before_action :authenticate_admin!, if: [:new, :create]
	before_action :set_companyadmin, only: [:show, :edit, :update, :destroy]

  # GET /companyadmins
  # GET /companyadmins.json
  def index
    @companyadmins = Companyadmin.all
  end

  # GET /companyadmins/1
  # GET /companyadmins/1.json
  def show
  end

  # GET /companyadmins/new
  def new
    @companyadmin = Companyadmin.new
  end

  # GET /companyadmins/1/edit
  def edit
  end

  # POST /companyadmins
  # POST /companyadmins.json
  def create
    @companyadmin = Companyadmin.create(companyadmin_params)
    respond_to do |format|
      if @companyadmin.save
        format.html { redirect_to dashboard_path }
        format.json { render :show, status: :created, location: @companyadmin }
      else
        format.html { render :new }
        format.json { render json: @companyadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companyadmins/1
  # PATCH/PUT /companyadmins/1.json
  def update
    respond_to do |format|
      if @companyadmin.update(companyadmin_params)
        format.html { redirect_to @companyadmin, notice: 'companyadmin was successfully updated.' }
        format.json { render :show, status: :ok, location: @companyadmin }
      else
        format.html { render :edit }
        format.json { render json: @companyadmin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companyadmins/1
  # DELETE /companyadmins/1.json
  def destroy
    @companyadmin.destroy
    respond_to do |format|
      format.html { redirect_to companyadmins_url, notice: 'companyadmin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_companyadmin
      @companyadmin = Companyadmin.friendly.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def companyadmin_params
      params.require(:companyadmin).permit(:sub_no, :email, :password, :type, :fname, :lname, :address, :phone, :city, :state)
    end
end