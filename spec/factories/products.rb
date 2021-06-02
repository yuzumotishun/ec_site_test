FactoryBot.define do
  factory :product do
    user { nil }
    category { nil }
    sale_status { nil }
    product_status { nil }
    product_name { "りんご" }
    price { 200 }
    description { "あああああああああああああああああ" }
  end
end
