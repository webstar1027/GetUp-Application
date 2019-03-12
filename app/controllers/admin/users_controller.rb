class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :toggle_enable_status, :edit, :destroy, :update]

  def index
    @users = User.user
  end

  def edit;end

  def update
    if @user.update(permit_params)
      redirect_to admin_users_path, notice: "#{@user.username}  was Updated successfully."
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(permit_params)
    @user.role = User.roles[:user]
    if @user.save!
      redirect_to admin_users_path, notice: "#{@user.username}  was Created successfully."
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "#{@user.username}  was deleted successfully."
    end
  end

  def toggle_enable_status
    @user.toggle!(:active)
    if @user.active == true
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: "#{@user.username} was successfully activated." }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_users_path, alert: "#{@user.username}  was successfully suspended." }
      end
    end
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def permit_params
    params.require(:user).permit(:avatar, :email, :username, :country_id, :address, :password)
  end
end
