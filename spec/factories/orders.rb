FactoryBot.define do
  factory :order do
    user {nil}
    order_number { rand(99_999_999) }
  end
end
