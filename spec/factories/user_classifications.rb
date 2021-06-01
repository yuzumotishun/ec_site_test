FactoryBot.define do
  factory :user_classification do
    trait :customer do
      user_classification_name { "購入者" }
    end
  end
end
