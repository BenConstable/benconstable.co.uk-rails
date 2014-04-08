source 'https://rubygems.org'

ruby '1.9.2'

gem 'rails', '3.2.11'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer', :platforms => :ruby
  gem 'less-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'twitter'
gem 'haml'
gem 'dalli'
gem 'memcachier'
gem 'maruku'

# Install foreman in development
group :development do
  gem 'foreman'
end

# Use Thin in Production, for Heroku
group :production do
  gem 'thin'
  gem 'rails_12factor'
end
