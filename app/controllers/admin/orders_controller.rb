class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_items = Order_item.all
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update
      redirect_to admin_order_path
    end
  end
  
end
