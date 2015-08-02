namespace :db do
  desc "Loads fixtures from test/fixtures and initializes all slugs for users and blog posts"
  task :reset_db => :environment do
    # Load fixtures
    Rake::Task['db:fixtures:load'].invoke
    # Compute slugs
    User.all.each { |user| user.save }
    BlogPost.all.each { |post| post.save }
    Event.all.each { |event| event.save }
  end
end