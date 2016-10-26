class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_cart

  def set_current_cart
    session[:cart_id] ||= Cart.create.id
  end
end
