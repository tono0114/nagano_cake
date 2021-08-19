class Public::CartItemsController < ApplicationController

  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      if @cart.present?
        @cart.amount += @cart_item.amount
        @cart.save
      else
        @cart_item.save
        #@genres = Genre.all
        #@item = Item.find_by(id: params[:cart_item][:item_id])
        #render 'public/items/show'
      end
      redirect_to public_cart_items_path
      flash[:notice] = "カートに商品を追加しました"
  end

  def index
    @cart_items = current_customer.cart_items.includes([:item])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
      flash[:notice] = "商品の数量を変更しました"
      redirect_to public_cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    if @cart_item.destroy
      flash[:notice] = "商品を削除しました"
      redirect_to public_cart_items_path
    end
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id)
  end

end
