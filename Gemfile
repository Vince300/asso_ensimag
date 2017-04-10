source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use PostgreSQL in production
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
if RbConfig::CONFIG['host_os'] =~ /mingw/
  gem 'bcrypt', '~> 3.1.7', platform: :ruby
else
  gem 'bcrypt', '~> 3.1.7'
end

# Use unicorn as the app server
# gem 'unicorn'

# Use debugger
# gem 'debugger', group: [:development, :test]

# Slim templating
gem 'slim-rails'

# i18n
gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x'
gem 'devise-i18n'

# Slug generation
gem 'friendly_id', '~> 5.1.0'

# Markdown editor
gem 'ckeditor'
gem 'rails-html-sanitizer'

# FontAwesome
gem 'font-awesome-rails'

# E-mail spam protection
gem 'actionview-encoded_mail_to'

# DateTime picker
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

# Date validation
gem 'date_validator'

# URL validation
gem 'validate_url'

# Color manipulation
gem 'chroma'

# Pagination
gem "kaminari"

# Authentication
gem 'devise', github: 'plataformatec/devise'

# Authorization
gem 'pundit'

# Bundler
gem 'bundler'

# Administration interface
gem 'activeadmin', github: 'gregbell/active_admin'

# form helper
gem 'simple_form'

# Bootstrap packages
gem 'bootstrap-sass', '3.3.5'
gem 'bootstrap-sass-extras'

# CarrierWave (uploads)
gem 'carrierwave'
gem 'mini_magick'

# Misc
gem 'tzinfo-data'

# More validation attributes
gem 'validates_formatting_of'

# Better error page development
group :development do
  gem 'binding_of_caller'
  gem 'better_errors'
end

# Test gems
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :test do
  gem 'ffaker', '~> 2.1.0'
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver', '~> 2.43.0'
end

