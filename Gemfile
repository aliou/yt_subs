source 'https://rubygems.org'
ruby '2.1.2'

###############################################################################
# Default Stuff                                                               #
###############################################################################

gem 'rails', '4.1.4'

# Database.
gem 'pg'

# Webserver
gem 'unicorn'

###############################################################################
# Assets                                                                      #
###############################################################################

# CSS
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'

# JS
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

###############################################################################
# Environments                                                                #
###############################################################################

group :test, :development do
  gem 'dotenv-rails'
end

group :test do
  gem 'webmock', '~> 1.9.3'
  gem 'vcr', '~> 2.9.3'
end

group :development do
  gem 'pry-rails'

  gem 'rails_12factor'
  gem 'spring'

  gem 'better_errors'
  gem 'binding_of_caller'
end

###############################################################################
# Application                                                                 #
###############################################################################

gem 'yt', '~> 0.10.2'

gem 'simple_form', '~> 3.0.2'

