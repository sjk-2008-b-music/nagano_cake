class Item < ApplicationRecord

	belongs_to :genre
	attachment :image
	has_many :order_details, dependent: :destroy
end
