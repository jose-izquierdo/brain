source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Serialization http://jsonapi-rb.org/guides/
gem 'jsonapi-rails'

# Finnhub
gem 'finnhub_ruby', '~> 1.1.2'

# Background
gem 'redis-namespace'
gem 'sidekiq'
gem 'sidekiq-client-cli'
# More info -> https://github.com/moove-it/sidekiq-scheduler
gem 'sidekiq-scheduler'


# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# CI
gem 'travis'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'database_cleaner'

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'dotenv-rails'
end

group :test do
  gem 'rspec-sidekiq'
  gem 'vcr'
  gem 'webmock', require: nil
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Static analyzer and formatter for Ruby.
  # More info -> https://github.com/rubocop-hq/rubocop
  gem 'rubocop', '~> 1.9.0', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
