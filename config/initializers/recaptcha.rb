Recaptcha.configure do |config|
  config.site_key = ENV.fetch('RECAPTCHA_SITE_KEY')
  config.secret_key = ENV.fetch('RECAPTCHA_SECRET_KEY')
  # config.use_ssl_by_default = true
end