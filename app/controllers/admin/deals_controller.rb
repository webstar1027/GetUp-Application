class Admin::DealsController < Admin::BaseController
  before_action :set_deal, only: [:show, :edit, :update, :destroy]
  before_action :check_business_profile, only: [:new, :request_for_quest]
  layout 'admin', except: [:public_show]
  # GET /deals
  # GET /deals.json
  def index
    @deals = Deal.all
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
    @deal = Deal.new
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
    @deal.update(status: "Active")
    redirect_to admin_deals_path, notice: "Deal successfully Apperoved"
  end

  # POST /deals
  # POST /deals.json
  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to admin_deal_path(@deal), notice: 'Your Deal - ' + @deal.name + ' - was successfully submitted.'
    else
      render :new
    end
  end

  # PATCH/PUT /deals/1
  # PATCH/PUT /deals/1.json
  def update
    if @deal.update(deal_params)
      redirect_to admin_deal_path(@deal), notice: 'Your Deal - ' + @deal.name + ' - was successfully Updated.'
    else
      render :edit
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.json
  def destroy
    if @deal.destroy
      redirect_to admin_deals_path, notice: 'Your Deal - ' + @deal.name + ' - was successfully Updated.'
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
      redirect_to admin_deal_path(params[:id])
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
