ActionMailer::Base.smtp_settings = {
    :user_name => ENV['GMAIL_USERNAME'],
    :password => ENV['GMAIL_PASSWORD'],
    :domain => 'localhost:3000',
    :address => 'smtp.gmail.com',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }

ActionMailer::Base.default_url_options[:host] = "localhost:3000"

# ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)