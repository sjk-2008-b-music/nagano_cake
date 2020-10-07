class AdminsController < ApplicationController
	def top
		@orders = Order.where(created_at: Date.today.all_day)
	end
end
