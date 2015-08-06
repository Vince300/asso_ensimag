FactoryGirl.define do
  factory :event do
    name         { FFaker::LoremFR.phrase }
    sequence(:start_time) { |n| random_date(n) }
    end_time     { date_after(start_time) }
    location     { FFaker::AddressFR.city }
    description  { FFaker::LoremFR.paragraph }
    facebook_url { FFaker::Internet.http_url }
    association :asso, factory: :user

    factory :coming_event do
      start_time { random_date(1) }
      end_time { date_after(start_time) }
    end

    factory :passed_event do
      start_time { random_date(0) }
      end_time { date_after(start_time) }
    end
  end
end