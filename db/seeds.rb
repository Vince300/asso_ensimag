require 'active_record/fixtures'

e = ENV['FIXTURES_ENV'] || Rails.env
if e == "test"
  e = "development"
end

r = Rails.root.join('db', 'fixtures', e)
ActiveRecord::FixtureSet.create_fixtures(r, Dir[r + "/*.yml"])
