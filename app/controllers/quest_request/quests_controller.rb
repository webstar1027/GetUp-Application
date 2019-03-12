class QuestRequest::QuestsController < ApplicationController
  before_action :set_deal
  layout 'dashboard'

  def new
    @quest = Quest.new(deal: @deal)
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.deal = @deal
    respond_to do |format|
      if @quest.save
        format.html { redirect_to admin_quest_request_index_path, notice: 'Quest was successfully created.' }
        format.json { render :show, status: :created, location: @quest }
      else
        @deals = Deal.super_deal.pending
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def set_deal
      @deal = Deal.find(params[:quest_request_id])
    end

    def quest_params
      params.require(:quest).permit(:title, :location, :start_datetime, :end_datetime, :instructions, :cover_photo, :deal_id, locations_attributes: [:id, :name, :_destroy], deal_attributes: [:id, :name, :description, :user_id, :posted_date, :expiry_date, :coupon_count, :cover_photo, :discount_type, :exclusive, :coupon_expiry_date, :terms, :free_gift_remart, :value_discount_remark, :percentage_discount_remark, :super_deal])
    end
end
