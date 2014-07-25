class NotificationController < ApplicationController
	include NotificationHelper

	def index
	end

	def authenticate
		send_sms(9099640670, 'authentication testing')
	end

	def receive_sms
		sender = params["From"]
		reply = params["Body"]
		p "*"* 150
		p sender
		p "*"* 150
		p reply
		SMSLogger.log_text_message sender, reply
	end

		# friends = {
		# 	9099640670 => "Kenneth"
		# }
		# name = friends[sender] || "YO"
		# twiml = Twilio::TwiML::Response.new do |r|
		# 	r.Message "Hello, #{name}. Thanks for the message"
		# end
		# twiml.text

end 
