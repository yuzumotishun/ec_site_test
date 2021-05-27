FactoryBot.define do
  factory :order do
    order_number { rand(99_999_999) }
  end
end
