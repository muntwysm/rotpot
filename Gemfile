source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'pg'
gem 'haml-rails'
gem 'omniauth-twitter'
gem 'omniauth-facebook', '1.4.0'
gem 'omniauth-google'
gem 'omniauth-google-oauth2'
gem 'figaro'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test, :development do
  gem 'turn', :require => false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  # gem 'ruby-debug-base19', '0.11.24'
	# gem 'ruby-debug19', '0.11.6'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end
