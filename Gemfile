source :rubygems

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra', '~> 1.0'
gem 'sinatra-contrib'

# Use Thin for our web server
gem 'thin'
gem 'puma'

gem 'activesupport'
gem 'activerecord',  '~>5.0.1'

gem 'rake'
gem 'shotgun'
gem 'bcrypt'
gem 'dotenv', "~> 2.1.2"

# Koala: Facebook OAuth and Graph API
gem "koala", "~> 2.2"

# Magic the Gathering SDK for Ruby
gem 'mtg_sdk', "~> 3.1"

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec',  '~>3.5.0'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
  gem 'faker', '~> 1.7.2'
end
