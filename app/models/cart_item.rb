class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :end_user
	validates :amount, presence: true

	# def total_price
	# 	item.price * amount
	# end
end
