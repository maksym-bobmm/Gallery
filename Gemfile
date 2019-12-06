# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.6.3'
gem 'activeadmin'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap'
gem 'bootstrap4-kaminari-views', '~> 1.0', '>= 1.0.1'
gem 'capistrano'
gem 'capistrano-bundler'
gem 'capistrano-figaro-yml', '~> 1.0.2'
gem 'capistrano-passenger', '>= 0.1.1'
gem 'capistrano-rails'
gem 'capistrano-rvm'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'devise-i18n'
gem 'faker'
gem 'figaro'
gem 'fog-aws'
gem 'friendly_id'
gem 'haml'
gem 'haml-rails', '~> 2.0'
gem 'i18n', '~> 1.6'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'nokogiri'
gem 'omniauth-facebook'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'
gem 'rails', '~> 5.2.3'
gem 'recaptcha'
gem 'redis'
gem 'resque'
gem 'resque-web', require: 'resque_web'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.8', '>= 3.8.2'
end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
group :test do
  gem 'capybara'
  # Easy installation and use of chromedriver to run system tests with Chrome
  # gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.7'
  gem 'rspec'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  # Adds support for Capybara system testing and selenium driver
  gem 'simplecov', require: false
  gem 'webdrivers'
end
