# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#  :address => 'smtp.mailgun.org',
#  :port => 587,
#  :authentication => :plain,
#  :user_name => ENV['MAILGUN_USERNAME'],
#  :password => ENV['MAILGUN_PASSWORD'],
#  :domin => 'heroku.com',
#  :enable_starttle_auto => true
# }

ActionMailer::Base.smtp_settings = {
  :port           => ENV['MAILGUN_SMTP_PORT'],
  :address        => ENV['MAILGUN_SMTP_SERVER'],
  :user_name      => ENV['MAILGUN_SMTP_LOGIN'],
  :password       => ENV['MAILGUN_SMTP_PASSWORD'],
  :domain         => 'herokuapp.com',
  :authentication => :plain,
  :enable_starttle_auto => true
}

ActionMailer::Base.delivery_method = :smtp
