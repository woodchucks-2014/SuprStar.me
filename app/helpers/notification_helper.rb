module NotificationHelper
	def twilio_client
    twilio_token = "a548aad83f1af5ffe9d217904f4ab5f0"
    twilio_sid = "ACbc2cca55c5535fedc04a68a5f5d6da96"
    client = Twilio::REST::Client.new twilio_sid, twilio_token
	end

	def send_sms(phone_number, body)
		twilio_client.account.messages.create(
			:from => "+18454434529",
			:to => phone_number,
			:body => body
			)
	end

	def read_sms
		twilio_client.account.messages.list({:to => "+18454434529"}).first
	end
end
