FactoryGirl.define do
  factory :user do
    email       { FFaker::Internet.email }
    password    { FFaker::Internet.password }
    username    { FFaker::NameFR.name }
    description { FFaker::LoremFR.paragraph }
    sequence(:order)
    site_url     { FFaker::Internet.http_url }
    facebook_url { FFaker::Internet.http_url }
    color        { '#' + 3.times.map { |i| '%02x' % rand(255) } .join }
  end
end