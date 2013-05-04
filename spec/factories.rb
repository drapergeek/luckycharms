FactoryGirl.define do
  factory :unit do
    sequence(:name) { |n| "unit-#{n}" }
    sequence(:mac_address) { |n| "00:00:00:00:00:0#{n}" }
  end
end
