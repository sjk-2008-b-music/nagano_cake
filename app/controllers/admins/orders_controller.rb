class Admins::OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def update
		@order = Order.find(params[:id])
		@order_details = @order.order_details
		@order.update(order_params)

		if @order.status == "入金確認"
			@order_details.each do |order_detail|
			    order_detail.update(making_status: 1)
		    end
		end

		redirect_to admins_order_path(@order.id)
	end

	private
    def order_params
      params.require(:order).permit(:status)
    end
end
