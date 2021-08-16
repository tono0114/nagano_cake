class Public::OrdersController < ApplicationController

    def create
        @new_order = Order.new(order_params)
        if @new_order.save
            redirect_to public_orders_complete_path
        else
           @customer = current_customer
           @customers = Customer.all
           render 'public/orders/new'
        end
    end

    def new
        @new_order = Order.new
        @customer = current_customer
        @customers = Customer.all
    end

    def index
    end

    def show
    end

    def confirm
        @new_order = Order.new(order_confirm_params)
        @cart_items = CartItem.all
        @addresses = Address.all
    end

    def complete
    end

    private

    def order_params
        params.require(:order).permit(:postal_code,
                                     :address,
                                     :name,
                                     :shipping_cost,
                                     :payment_method,
                                     :customer_id)
    end

    def order_confirm_params
        params.require(:order).permit(:postal_code,
                                      :address,
                                      :name,
                                      :payment_method,
                                      :customer_id)
    end

end
