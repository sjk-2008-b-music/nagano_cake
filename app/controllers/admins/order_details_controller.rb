class Admins::OrderDetailsController < ApplicationController
	before_action :authenticate_admin!
	def update
		@order_detail = OrderDetail.find(params[:id])
		@order = @order_detail.order
		@order_details = @order.order_details
		@order_detail.update(order_detail_params)

		if @order_details.any?{|order_detail| order_detail.making_status == "製作中"}
			   @order.update(status: 2)
	    elsif @order_details.all?{|order_detail| order_detail.making_status == "製作完了"}
	    	   @order.update(status: 3)
		end

		redirect_to admins_order_path(@order_detail.order_id)
	end

	private
    def order_detail_params
      params.require(:order_detail).permit(:making_status)
    end

end
