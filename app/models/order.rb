class Order < ApplicationRecord
	belongs_to :users
	has_many :order_details
end
