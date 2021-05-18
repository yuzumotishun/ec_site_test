class OrderDetail < ApplicationRecord
  belongs_to :orders, :products, :shipment_statuses
end
