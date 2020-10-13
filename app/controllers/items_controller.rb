class ItemsController < ApplicationController

	def top
		@items = Item.all
	end

	def index
		@items = Item.all

	end

	def show
		@item = Item.find(params[:id])
	end

private
	def item_params
    	params.require(:item).permit(:name, :introduce, :image, :price )
	end

end
