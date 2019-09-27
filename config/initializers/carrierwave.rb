# frozen_string_literal: true

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
                             provider: 'AWS',
                             aws_access_key_id: Figaro.env.S3_KEY,
                             aws_secret_access_key: Figaro.env.S3_SECRET,
                             region: Figaro.env.S3_REGION
  }
  config.fog_directory = Figaro.env.S3_BUCKET_NAME
  # config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  # config.fog_public     = false                                  # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  #

  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.store_dir = 'test_images/'
  else
    config.storage = :fog
  end
end
