class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def stripe_connect
    auth_data = request.env["omniauth.auth"]
    @user = current_user
    if @user.persisted?
      # byebug
      @user.stripe_id = auth_data.uid
      @user.stripe_refresh_token = auth_data.credentials.refresh_token
      @user.stripe_access_key = auth_data.credentials.token
      @user.stripe_publishable_key = auth_data.info.stripe_publishable_key
      @user.save

      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = 'Stripe Account Connected' if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to host_dashboard
    end
  end

  def failure
    # If we do get failures we should probably handle them more explicitly than just rerouting to root. To review in the future with colo
    redirect_to root_path
  end
end