source 'https://rubygems.org'
ruby '2.1.1'

gem 'dotenv-rails', :groups => [:development, :test]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.0'

gem 'pg'

gem 'activeadmin', github: 'gregbell/active_admin'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

gem 'devise'
gem 'omniauth-facebook'
gem 'cancan'

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'paperclip', '~> 4.1'
gem 'paperclip-dropbox', '>= 1.1.7'

group :development do
  gem 'rails_layout'
end

group :test do
  gem 'rake'
  gem 'simplecov', require: false
  gem 'coveralls', require: false
end

group :production do
	gem 'rails_12factor'
  # Use unicorn as the app server
  gem 'unicorn'
end

gem 'rails_best_practices'
