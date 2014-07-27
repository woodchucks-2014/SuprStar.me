module NotificationHelper
	def twilio_client
    twilio_token = ENV["TWILIO_API_KEY"]
    twilio_sid = ENV["TWILIO_ACC_SID"]
    client = Twilio::REST::Client.new twilio_sid, twilio_token
	end

	def send_sms(phone_number, body)
		twilio_client.account.messages.create(
			:from => '+18454434529',
			:to => phone_number,
			:body => body
			)
	end

	def read_received_sms
		twilio_client.account.messages.list({:to => '+18454434529'}).first
	end

end

