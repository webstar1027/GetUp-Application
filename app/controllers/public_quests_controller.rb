class PublicQuestsController < ApplicationController

  def index
    @quests = Quest.where(pause: false).where("start_datetime < ? AND end_datetime >= ?", Date.today + 1.day, Date.today).order("id DESC")
  end

  def show
    @quest = Quest.find(params[:id])
    @deal = @quest.deal
  end
end
