class BaseDeviseController < ApplicationController
  before_action do
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
