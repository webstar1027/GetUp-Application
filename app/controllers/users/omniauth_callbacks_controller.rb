
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in(@user)
        redirect_to dashboard_path
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        redirect_to new_user_registration_path
      end
    end

    def twitter
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in(@user)
        redirect_to dashboard_path
        set_flash_message(:notice, :success, kind: 'Twitter') if is_navigational_format?
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        redirect_to new_user_registration_path
      end
    end

    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in(@user)
        redirect_to dashboard_path
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        redirect_to new_user_registration_path
      end
    end

    def failure
      redirect_to root_path
    end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
