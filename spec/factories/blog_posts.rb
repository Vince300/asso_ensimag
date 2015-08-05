FactoryGirl.define do
  factory :blog_post do
    title     { FFaker::LoremFR.sentence(10) }
    summary   { FFaker::LoremFR.sentence }
    published { FFaker::Time.date }
    body      { FFaker::LoremFR.paragraph }
    association :author, factory: :user
  end
end