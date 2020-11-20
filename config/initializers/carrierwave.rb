require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    config.storage = :file
  else
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials[:aws_s3][:access_key_id],
      aws_secret_access_key: Rails.application.credentials[:aws_s3][:secret_access_key],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'flea-market-app0821'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/flea-market-app0821'
  end
end