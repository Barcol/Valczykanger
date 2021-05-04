class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_path
    end
  end

  def facebook_user_deletion
    signed_request = params["signed_request"]
    secret = Rails.application.credentials.facebook[:APP_SECRET]
    data = ParseFacebookSignedRequest.call(signed_request, secret)

    user = User.find_by(uid: data["user_id"])
    user.destroy!

    data = { confirmation_code: "del_#{user.uid}" }

    respond_to do |format|
      format.json { render json: data }
    end
  end

  def failure
    redirect_to unauthenticated_root_path
  end
end
