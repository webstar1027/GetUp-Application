class Admin::BusinessOwnersController < Admin::BaseController
  before_action :set_business_owner, only: [:show, :edit, :update, :destroy, :toggle_enable_status]

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
    if @business_owner.save
      redirect_to admin_business_owner_path(@business_owner), notice: 'Business Owner was successfully created.'
    else
      render :new
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
      if @business_owner.update(attributes)
        redirect_to admin_business_owner_path(@business_owner), notice: 'Business Owner was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /pois/1
  # DELETE /pois/1.json
  def destroy
    @business_owner.destroy
    redirect_to admin_business_owners_path, notice: 'Business Owner was successfully destroyed.'
  end
  
  def toggle_enable_status
    @business_owner.toggle!(:active)
    @business_owners = User.business_owners
    if @business_owner.active?
      redirect_to admin_business_owners_path, notice: 'Business Owner was successfully activated.'
    else
      redirect_to admin_business_owners_path, alert: 'Business Owner was successfully suspended.'
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
