class Public::OrdersController < ApplicationController

    def create
        @order = Order.new(order_params)
        if @order.save
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
    end

    def index
    end

    def show
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

#def confirm_params
	#これは許可をだし、戻り値に格納された値を返すがその後も処理があるのでメソッドの戻り値にはならない
	#params.permit(
		#カラムたち
	#)

	#こっちはこのメソッドの中で最後の処理なのでこの値がメソッドの戻り値になる
	#送られてきたパラメータのうちOrderのカラムとして適切な値をまとめる処理
#end