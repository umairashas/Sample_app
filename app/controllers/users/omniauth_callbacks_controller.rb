class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json
  def handle_omniauth(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user.persisted?
      if request.format.json?
        render json: { status: 'success', message: "Successfully authenticated via #{provider.capitalize}", user: @user }
      else
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
      end
    else
      if request.format.json?
        render json: { status: 'error', message: 'Authentication failed', errors: @user.errors.full_messages }, status: :unprocessable_entity
      else
        redirect_to new_user_registration_url
      end
    end
  end

   def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def google_oauth2
    handle_omniauth('Google')
  end

  def facebook
    handle_omniauth('Facebook')
  end
end