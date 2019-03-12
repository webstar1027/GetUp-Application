class BusinessOwnersController < ApplicationController
  before_action :set_business_owner, only: [:show, :edit, :update, :destroy, :toggle_enable_status]
  layout 'dashboard'

  # GET /pois
  # GET /pois.json
  def index
    @business_owners = User.business_owners
  end

  # GET /pois/1
  # GET /pois/1.json
  def show
  end

  # GET /pois/new
  def new
    @business_owner = User.new
  end

  # GET /pois/1/edit
  def edit
  end

  # POST /pois
  # POST /pois.json
  def create
    @business_owner = User.new(business_owners_params)
    @business_owner.role = "business_owner"
    respond_to do |format|
      if @business_owner.save
        format.html { redirect_to business_owner_path(@business_owner), notice: 'Business Owner was successfully created.' }
        format.json { render :show, status: :created, location: @business_owner }
      else
        format.html { render :new }
        format.json { render json: @business_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pois/1
  # PATCH/PUT /pois/1.json
  def update
    attributes = {}
    attributes[:username] = business_owners_params[:username]
    attributes[:password] = business_owners_params[:password] if business_owners_params[:password].present?
    attributes[:email] = business_owners_params[:email]
    attributes[:address] = business_owners_params[:address]
    attributes[:city] = business_owners_params[:city]
    attributes[:country_id] = business_owners_params[:country_id]
    attributes[:quest_option] = business_owners_params[:quest_option]
    respond_to do |format|
      if @business_owner.update(attributes)
        format.html { redirect_to business_owner_path(@business_owner), notice: 'Business Owner was successfully updated.' }
        format.json { render :show, status: :ok, location: @business_owners }
      else
        format.html { render :edit }
        format.json { render json: @business_owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @business_owner.destroy
    respond_to do |format|
      format.html { redirect_to business_owners_url, notice: 'Business Owner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def toggle_enable_status
    @business_owner.toggle!(:active)
    @business_owners = User.business_owners
    if @business_owner.active == true
      respond_to do |format|
        format.html { redirect_to business_owners_path, notice: 'Business Owner was successfully activated.' }
      end
    else
      respond_to do |format|
        format.html { redirect_to business_owners_path, alert: 'Business Owner was successfully suspended.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_owner
      @business_owner = User.business_owners.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_owners_params
      params.require(:user).permit(:username, :email, :password,:address,:city,:country_id, :avatar, :quest_option, images: [])
    end
end