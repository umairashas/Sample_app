class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  respond_to :json

  def google_oauth2
    handle_oauth('Google')
  end

  def github
    handle_oauth('GitHub')
  end

  def linkedin
    handle_oauth('LinkedIn')
  end

  private

  def handle_oauth(kind)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: kind) if is_navigational_format?
    else
      session["devise.#{kind.downcase}_data"] = request.env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url
    end
  end

end
