class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    #注文ステータス・製作ステータスの更新
    if @order.order_status_before_type_cast == 1
      @order.order_items.each do |oi|
        oi.update(create_status: 1)
      end
    end

    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
