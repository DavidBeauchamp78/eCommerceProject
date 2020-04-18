class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  before_action :load_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name delivery_info province_id])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name delivery_info province_id])
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def load_cart
    @cart = session[:cart]
  end
end
