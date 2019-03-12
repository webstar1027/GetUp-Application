class Admin::QuestRequestController < Admin::BaseController

  def index
    @quest_requests = Deal.super_deal.pending.order("id DESC")
  end
end
