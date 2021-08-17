class Public::AddressesController < ApplicationController

  def create
    @address = Address.new(address_params)
    @customer = current_customer
    if @address.save
      redirect_to public_addresses_path
    else
      @addresses = Address.all
      render 'public/addresses/index'
    end
  end

  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to public_addresses_path
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if @address.destroy
      redirect_to public_addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end

end
