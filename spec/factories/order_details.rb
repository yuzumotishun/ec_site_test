FactoryBot.define do
  factory :order_detail do
    order_detail_number { rand(64) }
    order_quantity { rand(1000) }
  end
end
