FactoryGirl.define do
  factory :bookmark do
    sequence(:name) { |n| "bookmark-#{n}" }
    sequence(:url) { |n| "url-#{n}" }
  end

  factory :unit do
    sequence(:name) { |n| "unit-#{n}" }
    sequence(:mac_address) { |n| "00:00:00:00:00:0#{n}" }
  end

  factory :user do
    sequence(:email) { |n| "email-#{n}@example.com" }
    password 'password'
  end
end
