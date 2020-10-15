class OrdersController < ApplicationController
	def new
		@orders = Order.all
		@order = Order.new
		@end_user = current_end_user
		@address = Address.where(end_user_id: current_end_user.id)
	end

	def confirm
		@order = Order.new(order_params)
		@order.payment_method = params[:order][:payment_method].to_i
		@cart_items = current_end_user.cart_items
		@end_user = current_end_user
		if params[:order][:id] == '1'
			@order_end_user = current_end_user
			@order.name = @order_end_user.first_name + @order_end_user.last_name
			@order.postal_code = @order_end_user.postal_code
			@order.address = @order_end_user.address
		elsif params[:order][:id] == '2'
			@order_end_user = Address.find(params[:order][:end_user_id])
			@order.name = @order_end_user.name
			@order.postal_code = @order_end_user.postal_code
			@order.address = @order_end_user.address
		else params[:order][:id] == '3'
			@order_end_user = Address.new()
			@order_end_user.save
		end
	end

	def complete
	end

	def create
		@end_user = current_end_user
		@order = Order.new(order_params)
		@order.end_user_id = @end_user.id
		@order.postal_code = params[:postal_code]
		@order.payment_method = params[:payment_method].to_i
		@order.address = params[:address]
		@order.name = params[:name]
		@order.total_payment = params[:total_payment]
		@order.shipping_cost = 800
		# @orders = @end_user.orders


		# @order_detail = OrderDetail.new(order_detail_params)
		# @order_detail.price = params[:price]
		# @order_detail.amount = params[:amount]


		@order.save
		@cart_items = CartItem.where(end_user_id: current_end_user.id)
		@order_end_user = Order.where(end_user_id: current_end_user.id)
		@cart_items.each do |cart_item|
			OrderDetail.create(amount: cart_item.amount, price: cart_item.item.price, item_id: cart_item.item_id, order_id: @order.id )
		end
		@cart_items.destroy_all
		redirect_to order_complete_path
	end



	def index
		@orders = Order.where(end_user_id: current_end_user.id)
		# @order_details = @orders.order_details
	end

	def show
		@order = Order.find(params[:id])
		@order_details = @order.order_details
	end

	def order_params
    	params.permit(:name, :address, :postal_code, :shipping_cost, :total_payment, :end_user_id, :id)
	end
	def address_params
		params.require(:address).permit(:name, :address, :postal_code)
	end
	def order_detail_params
    	params.permit(:order_id, :item_id, :praice, :amount)
	end
	def new_address_params
    	params.permit(:name, :address, :postal_code, :commit)
	end
end

