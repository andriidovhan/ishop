class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_cart
  before_action :set_locale

  private

  def set_current_cart
    session[:cart_id] ||= Cart.create.id
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
