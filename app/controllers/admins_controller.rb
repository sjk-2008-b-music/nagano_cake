class AdminsController < ApplicationController
	before_action :authenticate_admin!
	def top
		@orders = Order.where(created_at: Date.today.all_day)
	end
end