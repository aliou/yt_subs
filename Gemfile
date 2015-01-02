source 'https://rubygems.org'
ruby '2.1.5'

###############################################################################
# Default Stuff                                                               #
###############################################################################

gem 'rails', '4.1.4'

# Database.
gem 'pg'

# Webserver
gem 'unicorn'

# Logs
gem 'lograge'

###############################################################################
# Assets                                                                      #
###############################################################################

# CSS
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'bourbon', '~> 3.2.3'
gem 'neat', '~> 1.5.1'

# JS
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'

################################################################################
## Authentification                                                            #
################################################################################

gem 'omniauth', '~> 1.2.2'
gem 'omniauth-twitter', '~> 1.0.1'

################################################################################
## Mails                                                                       #
################################################################################

gem 'roadie', '~>3.0.1'
gem 'roadie-rails', '~> 1.0.3'

###############################################################################
# Environments                                                                #
###############################################################################

group :test, :development do
  gem 'dotenv-rails'
  gem 'byebug'
end

group :test do
  gem 'webmock', '~> 1.9.3'
  gem 'vcr', '~> 2.9.3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'pry-rails'

  gem 'spring'

  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'
end

###############################################################################
# Application                                                                 #
###############################################################################

gem 'yt', '~> 0.10.2'

gem 'simple_form', '~> 3.0.2'
