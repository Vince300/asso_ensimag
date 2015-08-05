FactoryGirl.define do
  factory :event do
    name         { FFaker::LoremFR.phrase }
    start_time   { DateTime.now + rand(12).days }
    end_time     { start_time.nil? ? FFaker::Time.date : (start_time + rand(24 * 3).hours) }
    location     { FFaker::AddressFR.city }
    description  { FFaker::LoremFR.paragraph }
    facebook_url { FFaker::Internet.http_url }
    association :asso, factory: :user
  end
end