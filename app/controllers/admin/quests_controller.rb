class Admin::QuestsController < Admin::BaseController
  before_action :set_quest, only: [:show, :edit, :update, :destroy, :pause, :resume]
  before_action :authenticate_user!
  before_action :user_admin!

  # GET /quests
  # GET /quests.json
  def index
    @quests = Quest.order("id DESC")
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
    @deals = Deal.super_deal.pending
  end

  # GET /quests/1/edit
  def edit
    @deals = Deal.super_deal
  end

  # POST /quests
  # POST /quests.json
  def create
    @quest = Quest.new(quest_params)
    if @quest.save
      redirect_to admin_quest_path(@quest), notice: 'Quest was successfully created.'
    else
      @deals = Deal.super_deal.pending
      render :new 
    end
  end

  # PATCH/PUT /quests/1
  # PATCH/PUT /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.html { redirect_to admin_quests_path, notice: 'Quest was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest }
      else
        @deals = Deal.super_deal.pending
        format.html { render :edit }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest.destroy
    respond_to do |format|
      format.html { redirect_to admin_quests_path, notice: 'Quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def pause
    @quest.update(pause: true)
    redirect_to admin_quests_path, notice: "Successfully Pause"
  end

  def resume
    @quest.update(pause: false)
    redirect_to admin_quests_path, notice: "Successfully Resume"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:title, :deal_id, :location, :start_datetime, :end_datetime, :instructions, :cover_photo, locations_attributes: [:id, :name, :_destroy], deal_attributes: [:id, :name, :description, :user_id, :posted_date, :expiry_date, :coupon_count, :cover_photo, :discount_type, :exclusive, :coupon_expiry_date, :terms, :free_gift_remart, :value_discount_remark, :percentage_discount_remark, :super_deal])
    end
end
