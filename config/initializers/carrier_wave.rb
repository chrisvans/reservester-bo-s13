CarrierWave.configure do |config|
	config.fog_credentials = {
		:provider => 'AWS'
		:aws_access_key_id => "AKIAIE4KP47ZZFDDLXRA" #ENV['AWS_ACCESS_KEY']
		:aws_secret_access_key => "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" # ENV['AWS_SECRET_KEY'] 

		# :endpoint => "nsnphu_reservester.s3-website-us-east-1.amazonaws.com"
	}

	config.fog_directory = 'nsnphu_reservester'
end