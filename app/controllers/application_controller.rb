class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # current_cart
    #current_cart = CartItem.find_by(id: session[:cart_item_id])
    #current_cart = CartItem.create unless current_cart
    #session[:cart_item_id] = current_cart_item.id
    #current_cart
  #end

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :password_confirmation])
  end

end
