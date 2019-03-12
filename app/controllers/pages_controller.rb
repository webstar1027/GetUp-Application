class PagesController < ApplicationController
  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end  
  
  def home
  end
  
  def questionaire
  end

  def business_profile
    @business = Business.where(user_id: params[:user_id]).take
    if @business.present?
      get_deals = Deal.where(user_id: params[:user_id])
      @deals = get_deals.where(super_deal: nil).all
      @quests = Quest.where(pause: false, deal_id: get_deals.where(super_deal: true).pluck(:id))
    else
      redirect_to root_path
    end
  end

  def my_profile;end

  def edit_profile
    @user = current_user
    render layout: 'dashboard'
  end
  
  def settings
    @user = current_user
    render layout: 'dashboard'
  end
  
  def dashboard
    if user_signed_in? && current_user.role == "super_admin"
      redirect_to admin_root_path
    elsif user_signed_in? && current_user.role == "business_owner"
      redirect_to bo_dashboard_path
    elsif user_signed_in? && current_user.role == "user"
      redirect_to user_dashboard_path
    else
      redirect_to root_path
    end
  end
  
  def bo_dashboard
    Pusher.trigger('my-channel', 'my-event', {
          message: 'hello world'
        })
    @deals = current_user.deals.last(3)
    render layout: 'dashboard'
  end
  
  def user_dashboard
    render layout: 'dashboard'
  end

  def user_params
    params.require(:user).permit(:username, :phone_num, :bio, :avatar, :age, :gender, :country_id, :city, :password, :password_confirmation)
  end
  
end
