class Public::CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
      redirect_to public_cart_items_path
    else
      @genres = Genre.all
      @item = Item.find_by(id: params[:cart_item][:item_id])
      render 'public/items/show'
    end


  end

  def index
    @cart_items = current_customer.cart_items.includes([:item])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to public_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      redirect_to public_cart_items_path
    end
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end
