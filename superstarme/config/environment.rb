# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

APP_CONG = YAML.load_file("#{RAILS_ROOT}/config/application.yml")

TWILIO_ACCOUNT_SID = twilio_account_sid
TWILIO_AUTH_TOKEN = twilio_account_sid
TWILIO_PHONE_NUMBER = twilio_phone_number
