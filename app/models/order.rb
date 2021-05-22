class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  def shipment_prepared?
    order_details.any? do |order_detail|
      order_detail.shipment_status.shipment_status_name == "準備中"
    end
  end

  def total_price
    order_details.map do |order_detail|
      order_detail.product.price * order_detail.order_quantity
    end
  end

  def sum_price
    total_price.sum
  end
end
