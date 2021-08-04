class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_sentry_context
  before_action :set_language, unless: :devise_controller?

  helper_method :current_melange

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to authenticated_root_path, alert: exception.message
  end

  private

  def current_melange
    Melange.first! # TODO: Remove this after multitenancy
  end

  def set_sentry_context
    if current_user
      Sentry.set_user(id: current_user.id, email: current_user.email)
    end
    Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
  end

  def set_language
    I18n.locale = current_user.language.to_sym || I18n.default_locale
  end
end
