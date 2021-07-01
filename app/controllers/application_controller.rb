class ApplicationController < ActionController::Base
  before_action :set_locale
  around_action :switch_locale
  def render_404
    render file: 'public/404.html', status: :not_found
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def switch_locale(&action)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  protect_from_forgery

  def default_url_options(options = {})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { locale: I18n.locale }
  end

end
