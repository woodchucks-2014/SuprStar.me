module ApplicationHelper

  def send_sms(user_phone_number, message)
    APP_CONFIG['twilio_account_sid']
    APP_CONFIG['twilio_auth_token']
    APP_CONFIG['twilio_phone_number']
    
    # TWILIO_ACCOUNT_SID
    # TWILIO_AUTH_TOKEN
    # TWILIO_PHONE_NUMBER

    # account_sid = ENV['TWILIO_ACCOUNT_SID']
    # auth_token = ENV['TWILIO_AUTH_TOKEN']

    @twilio_client = Twilio::REST::Client.new account_sid, auth_token

    @twilio_client.account.sms.messages.create(
      :from => APP_CONFIG['twilio_phone_number'],
      :to => user_phone_number,
      :body => message
    )
  end

end
