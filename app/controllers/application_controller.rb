class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  def current_cart
    if current_user
      current_cart = current_user.cart || current_user.create_cart!
    else
      current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
      session[:cart_id] ||= current_cart.id
    end
    current_cart
  end
  
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :address, :phone, :nickname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :address, :phone, :nickname])
    end
end
