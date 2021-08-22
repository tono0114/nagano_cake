class Public::OrdersController < ApplicationController

    def create
        @order = Order.new(order_params)
        @order.customer_id = current_customer.id

        #支払金額の計算
        total_price = 0
        current_customer.cart_items.each { |cart_item| total_price += cart_item.total_price }
        @order.total_payment = total_price + 800

        if @order.save
            @cart_items = current_customer.cart_items.all
            @cart_items.each do |cart_item|
                OrderItem.create(
                    item_id: cart_item.item.id,
                    order_id: @order.id,
                    amount: cart_item.amount,
                    order_price: cart_item.item.price
                )
            end
            @cart_items.destroy_all
            redirect_to public_orders_complete_path
        else
           @customer = current_customer
           render 'public/orders/new'
        end
    end

    def new
        @customer = current_customer
        @new_address = Address.new
    end

    def confirm
        confirm_params
        @order = Order.new
        @order.payment_method = params[:payment_method]
        @order.postal_code = params[:postal_code]
        @order.address = params[:address]
        @order.name = params[:name]
        @cart_items = current_customer.cart_items

        #配送先住所選択
        if params[:address_option] == "0"
            @order.address = current_customer.full_address
        elsif params[:address_option] == "1"
            @order.address = Address.find(params[:address_id]).full_address
        else
           @new_address = current_customer.addresses.new
           @new_address.address = @order.address
           @new_address.name = @order.name
           @new_address.postal_code = @order.postal_code
           if @new_address.save
            @order.address = @new_address.full_address
           else
            @customer = current_customer
            render "public/orders/new"
           end
        end
    end

    def complete
        @order = Order.new
        @cart_items = current_customer.cart_items
    end

    def index
        @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @order_item = @order.order_items
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

    def confirm_params
        params.permit(:payment_method,
                      :address_id,
                      :address_option,
                      :postal_code,
                      :address,
                      :name)

    end
end