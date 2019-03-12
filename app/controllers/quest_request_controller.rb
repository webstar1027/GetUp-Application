class QuestRequestController < ApplicationController
  layout 'dashboard'
  # GET /deals
  # GET /deals.json
  def index
    if current_user.role == "super_admin"
      @quest_requests = Deal.super_deal.pending.order("id DESC")
    else
      redirect_to root_path
    end
  end
end
