class Admin::OrderItemsController < ApplicationController
  
  def update
    @order_item = Order.find(params[:id])
    if @order_item.update
      redirect_to admin_order_path
    end
  end
  
end
