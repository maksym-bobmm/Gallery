# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
# require 'resque/server'
# run Rack::URLMap.new "/" => Gallery::Application,  "/resque" => Resque::Server.new
run Rails.application


