class OmniauthController < ApplicationController
  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = 'There was a problem singing you in through Github. Plese register or try singing in later'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:error] = 'There was a problem singing you in. Please register or try singing in later'
    redirect_to new_user_registration_url
  end
end
