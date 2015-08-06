FactoryGirl.define do
  factory :blog_post do
    title     { FFaker::LoremFR.sentence(10) }
    summary   { FFaker::LoremFR.sentence }
    sequence(:published) { |n| random_date(n) }
    body      { FFaker::LoremFR.paragraph }
    association :author, factory: :user

    factory :published_post do
      published { random_date(0) }
    end

    factory :not_published_post do
      published { random_date(1) }
    end
  end
end