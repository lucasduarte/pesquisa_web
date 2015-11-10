# Load the Rails application.
require File.expand_path('../application', __FILE__)

app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
load(app_env_vars) if File.exists?(app_env_vars)

ActionMailer::Base.smtp_settings = {
  :user_name => ENV["SG_USER"],
  :password => ENV["PASSWORD"],
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
# Initialize the Rails application.
Rails.application.initialize!
