class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  def shipment_prepared?
    order_details.any? do |order_detail|
      order_detail.shipment_status.shipment_status_name == "準備中"
    end
  end

  def sum_price
    order_details.sum do |order_detail|
      order_detail.total_price
    end
  end
end
