class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  layout 'dashboard'

  # GET /businesses
  # GET /businesses.json
  def index
    if current_user.role == "super_admin"
      @businesses = Business.all
    else
      redirect_to root_path
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
    gon.lat = nil
    gon.lng = nil
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)
    @business.user_id = current_user.id

    respond_to do |format|
      if @business.save
        if params[:commit] = "Preview"
          format.html { redirect_to "/business_profile/#{current_user.id}" }
        else
          format.html { redirect_to bo_dashboard_path, notice: 'Business Profile was successfully created.' }
        end
        format.json { render :show, status: :created, location: @business }
      else
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        if params[:commit] = "Preview"
          format.html { redirect_to "/business_profile/#{current_user.id}" }
        else
          format.html { redirect_to bo_dashboard_path, notice: 'Business Profile was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @business }
      else
        format.html { render :edit }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url, notice: 'Business was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
      # coordinate = @business.coordinate
      # if coordinate
      #   lat = coordinate.split(",").first.to_f
      #   lng = coordinate.split(",").second.to_f
      #   gon.lat = lat
      #   gon.lng = lng
      # else
      #   gon.lat = nil
      #   gon.lng = nil
      # end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      params.require(:business).permit(:business_name, :type_of_business, :halal, :district, :address, :coordinate, :avatar, :contact_email, :contact_number, :city, :country_id, :post_code, :description, :person_charge_name, :person_contact_number, :other_business, :vegan, :social_link, :operating_hours, :outlet)
    end
end
