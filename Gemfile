source 'https://rubygems.org'

ruby '2.0.0'

# Defaults

gem 'rails', '~> 3.2'
gem 'jquery-rails', '~> 3.0'
gem 'haml', '~> 4.0'
gem 'dalli', '~> 2.6'
gem 'memcachier'
gem 'maruku', '~> 0.7'

# Asset Gems

group :assets do
  gem 'libv8', '~>3.16.14.7'
  gem 'therubyracer', '~> 0.12', :platforms => :ruby
  gem 'less-rails', '~> 2.5'
  gem 'uglifier', '~> 2.5'
end

# Install Foreman in development

group :development do
  gem 'foreman', '~> 0.63'
end

# Use Thin in Production, for Heroku

group :production do
  gem 'thin', '~> 1.6'
  gem 'rails_12factor'
end
