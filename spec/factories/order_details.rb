FactoryBot.define do
  factory :order_detail do
    order { nil }
    product { nil }
    shipment_status { nil }
    order_detail_number { rand(64) }
    order_quantity { rand(1000) }
  end
end
