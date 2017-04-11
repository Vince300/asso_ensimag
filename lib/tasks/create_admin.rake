require 'securerandom'

namespace :asso do
  desc "Create the admin user with specified e-mail and generates a random password"
  task :create_admin, [:email] => [:environment] do |t, args|
    email = args[:email]
    pw = SecureRandom.base64(16)
    AdminUser.create(email: email, password: pw).save!
    puts "Created admin user with email #{email} and password #{pw}"
  end
end