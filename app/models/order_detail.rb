class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :product
	belongs_to :shipment_status
end
