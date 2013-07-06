CarrierWave.configure do |config|
  if ENV['LOCALSTORE'].present?
    config.storage = :file
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
    }

    config.fog_directory  = 'si.reservester'
  end
end
