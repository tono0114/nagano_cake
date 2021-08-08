 #frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_inactive_user, only: [:create]

  def after_sign_out_path_for(resource)
    public_root_path
  end

  def after_sign_in_path_for(resource)
    public_root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
   #def destroy

   #end

   protected

   def reject_inactive_user
     @customer = Customer.find_by(id: params[:customer][:customer_id])
     if @customer
       if @customer.valid_password?(params[:customer][:password]) && !@customer.is_active
         redirect_to new_customer_session_path
       end
     end
   end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
