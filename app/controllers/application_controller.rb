class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :set_sentry_context
  before_action :set_language, unless: :devise_controller?

  private

  def set_sentry_context
      Sentry.set_user(id: current_user.id, email: current_user.email) if current_user
      Sentry.set_extras(params: params.to_unsafe_h, url: request.url)
  end

  def set_language
    I18n.locale = current_user.language.to_sym || I18n.default_locale
  end
end
