require 'active_record/fixtures'

# The list of classes to load
class_names = [ :admin_users, :blog_posts, :events, :users ]

# Find out the environment
e = ENV['FIXTURES_ENV'] || Rails.env
if e == "test" and not Dir.exists? Rails.root.join('db', 'seeds', 'test')
  e = "development"
end

# Get the data directory
r = Rails.root.join('db', 'seeds', e)

# Load the fixtures
ActiveRecord::FixtureSet.create_fixtures(r, class_names)

# Apply save method to all classes
class_names.map { |s| s.to_s.classify.constantize } .each do |cls|
  cls.find_each(&:save)
end