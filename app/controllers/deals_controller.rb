class DealsController < ApplicationController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  before_action :check_business_profile, only: [:new, :request_for_quest]
  layout 'dashboard', except: [:public_show]
  # GET /deals
  # GET /deals.json
  def index
    if current_user.role == "super_admin"
      @deals = Deal.all
    elsif current_user.role == "business_owner"
      @deals = current_user.deals.where(super_deal: nil)
    elsif current_user.role == "user"
      @deals = Deal.where(status: "Active")
    else
      redirect_to root_path
    end
  end
  
  def get_user_quests
    @deals = Deal.where(super_deal: true, user_id: params[:user_id])
    render :index
  end

  def get_user_deals
    @deals = Deal.where(super_deal: nil, user_id: params[:user_id])
    render :index
  end
  
  def super_deals
    if current_user.role == "business_owner" && current_user.quest_option
      @deals = Deal.where(super_deal: true)
    end
  end
  
  def request_for_quest
    if current_user.role == "business_owner" && current_user.quest_option
      @deal = Deal.new
    else
      redirect_to deals_path
    end
  end

  # GET /deals/1
  # GET /deals/1.json
  def show
  end
  
  def public_show
    @deals = Deal.where(status: "Active")
  end
  
  def requests
    @deals = Deal.where(status: "Pending")
  end
  

  # GET /deals/new
  def new
    if current_user.role == "super_admin" || current_user.role == "business_owner"
      @deal = Deal.new
    else
      redirect_to deals_path
    end
  end

  # GET /deals/1/edit
  def edit
    unless current_user.role == "super_admin" || current_user.role == "business_owner"
      redirect_to deals_path
    end
  end
  
  # APPROVE
  def approve
    
    @deal = Deal.find(params[:id])
    if current_user.role == "super_admin"
      @deal.update(status: "Active")
      respond_to do |format|
        format.js
      end
    else
      redirect_to deals_path
    end
  end

  # POST /deals
  # POST /deals.json
  def create
    if current_user.role == "super_admin"
      @deal = Deal.new(deal_params)
    elsif current_user.role == "business_owner"
      @deal = current_user.deals.new(deal_params)
    end

    respond_to do |format|
      if @deal.save
        format.html { redirect_to @deal, notice: 'Your Deal - ' + @deal.name + ' - was successfully submitted.' }
        format.json { render :show, status: :created, location: @deal }
      else
        format.html { render :new }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    respond_to do |format|
      if @deal.update(deal_params)
        format.html { redirect_to @deal, notice: 'Deal was successfully updated.' }
        format.json { render :show, status: :ok, location: @deal }
      else
        format.html { render :edit }
        format.json { render json: @deal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    @deal.destroy
    respond_to do |format|
      format.html { redirect_to deals_url, notice: 'Deal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # CLAIM deals
  def claim
    @deal = Deal.find(params[:id])
    
    if @deal.coupons.count < @deal.coupon_count
      code = ('a'..'z').to_a.shuffle[0,8].join.upcase
      @coupon = @deal.coupons.new(code: code, user_id: current_user.id)
    
    
      respond_to do |format|
        if @coupon.save
          format.js
        else
          format.html { redirect_to deal_path(params[:id])}
        end
      end
    else
      redirect_to deal_path(params[:id])
    end
  end

  private
  
    def check_business_profile
      if current_user.role == "business_owner"
        if current_user.business.blank?
          redirect_to new_business_path, alert: "Please set up your business profile to proceed"
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_deal
      @deal = Deal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_params
      params.require(:deal).permit(:name, :description, :user_id, :posted_date, :expiry_date, :coupon_count, :cover_photo, :discount_type, :exclusive, :coupon_expiry_date, :terms, :free_gift_remart, :value_discount_remark, :percentage_discount_remark, :super_deal)
    end
end
