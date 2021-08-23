class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    order_item.update(order_item_params)

    #注文ステータス・製作ステータスの更新
    if order_item.create_status_before_type_cast == 2
       order_item.order.update(order_status: 2)
    end

    @count = 0
    order_item.order.order_items.each do |order_item|
      if order_item.create_status_before_type_cast == 3
      @count += 1
      end
    end
    if @count == order_item.order.order_items.size
      order_item.order.update(order_status: 3)
    end
    redirect_to admin_order_path(order_item.order.id)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:create_status)
  end

end
