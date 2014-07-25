module NotificationHelper
	def twilio_client
    twilio_token = ENV["TWILIO_API_KEY"]
    twilio_sid = ENV["TWILIO_ACC_SID"]
    client = Twilio::REST::Client.new twilio_sid, twilio_token
	end

end