class AuthenticationsController < Devise::OmniauthCallbacksController
  def weibo
    omniauth_process
  end
  protected
  def omniauth_process
    omniauth = request.env['omniauth.auth']
    authentication = Authentication.where(provider: omniauth.provider, uid: omniauth.uid.to_s).first

    if authentication
      set_flash_message(:notice, :signed_in)
      sign_in(:user, authentication.user)
      redirect_to root_path
    elsif current_user
      authentication = Authentication.create_from_hash(current_user.id, omniauth)
      set_flash_message(:notice, :add_provider_success)
      redirect_to authentications_path
    else
      session[:omniauth] = omniauth.except("extra")
      set_flash_message(:notice, :fill_your_email)
      redirect_to new_user_registration_url
    end
  end

  def after_omniauth_failure_path_for(scope)
    new_user_registration_path
  end
end
