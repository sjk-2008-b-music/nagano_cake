class Admins::ItemsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@items = Item.all
		@item = Item.new
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.save
		redirect_to admins_item_path(@item)
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		redirect_to admins_item_path(@item)
    end

	private
	def item_params
		params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active)
	end

end
