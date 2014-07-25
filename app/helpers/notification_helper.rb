module NotificationHelper

	def send_sms(phone_number, body)  
		twilio_token = ENV["TWILIO_API_KEY"]
		twilio_sid = ENV["TWILIO_ACC_SID"]
  	# real_phone_number = "+1" + phone_number.delete("-")
  	@client = Twilio::REST::Client.new twilio_sid, twilio_token
  	@client.account.messages.create(
  		:from => '+18454434529',
  		:to => phone_number,
  		:body => body
  	)
  end
end
