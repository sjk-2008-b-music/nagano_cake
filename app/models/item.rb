class Item < ApplicationRecord
	has_many :cart_ietmes, dependent: :destroy
	belongs_to :genre
	attachment :image
	has_many :order_details, dependent: :destroy

	validates :genre_id, presence: true
	validates :name, presence: true
	validates :introduction, presence: true
	validates :price, presence: true

end
