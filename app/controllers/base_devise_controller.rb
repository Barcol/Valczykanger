class BaseDeviseController < ApplicationController
  class Responder < ActionController::Responder
    def to_turbo_stream
      controller.render(options.merge(formats: :html))
    rescue ActionView::MissingTemplate => error
      if get?
        raise error
      elsif has_errors? && default_action
        render rendering_options.merge(formats: :html, status: :unprocessable_entity)
      else
        redirect_to navigation_location
      end
    end
  end

  self.responder = Responder
  respond_to :html, :turbo_stream

  before_action do
    cookies.permanent[:locale] = params[:locale] if params[:locale]
    unless I18n.available_locales.include?(cookies.permanent[:locale]&.to_sym)
      cookies.permanent[:locale] = I18n.default_locale
    end
    I18n.locale = cookies[:locale] || I18n.default_locale
  end
end
