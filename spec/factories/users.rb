FactoryBot.define do
  factory :user do
    user_classification {nil}
    first_name { "佐藤" }
    last_name { "秀雄" }
    sequence(:email) {|n| "tester#{n}@example.com" }
    password { "password" }
    zipcode { "123-4567" }
    prefecture { "東京都" }
    municipality { "台東区" }
    address { "1-2-3" }
    apartments { "台東ビル" }
    phone_number { "080-1234-5678" }
  end
end
