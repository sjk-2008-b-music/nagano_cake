class CartItemsController < ApplicationController
	# before_action :authenticate_end_user!

	def index
		@cart_items = CartItem.all

	end

	def update
		@cart_item = CartItem.find(params[:id])
		if @cart_item.update(amount: params[:amount])
          redirect_to cart_items_path(@cart_item)
        end
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
    	@cart_item.destroy
    	redirect_to cart_items_path
	end

	def destroy_all
		CartItem.destroy_all
		redirect_to cart_items_path
	end

	def create
		@cart_items = CartItem.all
		@end_user_item = current_end_user.cart_items.find_by(item_id: params[:item_id])
		pp @end_user_item
		if @end_user_item.present?
			@end_user_item.amount += params[:amount].to_i
		else
			# @end_user_item = @cart_items.build(item_id: params[:item_id])
			@end_user_item = current_end_user.cart_items.new(cart_item_params)
			@end_user_item.item_id = params[:item_id]
    	end
    	@end_user_item.save!
    	redirect_to cart_items_path
	end

	private

	 def cart_item_params
		 params.permit(:amount, :item_id, :end_user_id)
     end


	def setup_cart_item!
    	@cart_item = end_user.cart_items.find_by(item_id: params[:item_id])
  	end

end
