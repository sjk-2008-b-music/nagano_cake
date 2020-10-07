class OrdersController < ApplicationController
	def new
	end

	def confirm
	end

	def complete
	end

	def create
		@order = Order.new(order_params)
	end

	def index
		@order_details = OrderDetail.all
		@end_user = current_end_user
	end

	def show
		@order = Order.find(params[:id])
		@end_user = current_end_user
		@order_details = @order.order_details
	end

	 private
	def order_params
	    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
	end

end


