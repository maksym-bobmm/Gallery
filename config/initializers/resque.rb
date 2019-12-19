# frozen_string_literal: true

if ENV["REDIS_URL"] && Rails.env.production?
  Resque.redis = Redis.new(uri: ENV["REDIS_URL"])
else
  uri = URI.parse('redis://localhost:6379/')
  Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
end
Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }
Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))
Resque.logger.level = Logger::DEBUG
