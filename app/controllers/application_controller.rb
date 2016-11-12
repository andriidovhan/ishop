class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_cart
  before_action :set_locale
  before_filter :authenticate_user!

  # , except => [:add_to_cart]
  # def add_to_cart
  #   # do something
  # end

  private

  def set_current_cart
    session[:cart_id] ||= Cart.create.id
  end

  # def set_locale
  #   I18n.locale = params[:locale] || I18n.default_locale
  # end

  # http://stackoverflow.com/questions/25329511/rails-locale-not-persistent
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
