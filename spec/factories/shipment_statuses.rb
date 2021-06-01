FactoryBot.define do
  factory :shipment_status do
    trait :preparation do
      shipment_status_name { "準備中" }
    end
    trait :shipped do
      shipment_status_name { "発送済" }
    end
  end
end
