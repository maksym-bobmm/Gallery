CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider: 'AWS',                             # required
      aws_access_key_id: Figaro.env.S3_KEY ,           # required
      aws_secret_access_key: Figaro.env.S3_SECRET,     # required
      region: Figaro.env.S3_REGION                        # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = Figaro.env.S3_BUCKET_NAME               # required
  # config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  # config.fog_public     = false                                  # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  #
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end
end