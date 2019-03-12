class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :check_super_admin
  
  def check_super_admin
    unless current_user.super_admin?
      return redirect_to root_path
    end
  end

end