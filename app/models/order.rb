class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details

  def shipment_status
    self.order_details.any? do |order_detail|
      order_detail.shipment_status.shipment_status_name == "準備中"
    end
  end

  def shipment_prepared?
    shipment_status
  end
end
