FactoryGirl.define do
  factory :unit do
    sequence(:name) { |n| "unit-#{n}" }
    sequence(:mac_address) { |n| "00:00:00:00:00:0#{n}" }
  end

  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com" }
    password 'password'
  end
end
