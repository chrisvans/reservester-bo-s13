CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider => 'AWS',
		:aws_access_key_id => ENV['AWS_ACCESS_KEY'],
		:aws_secret_access_key => ENV['AWS_SECRET_KEY']

		# :endpoint => "nsnphu_reservester.s3-website-us-east-1.amazonaws.com"
	}

	config.fog_directory = 'nsnphu_reservester' #bucket name
end