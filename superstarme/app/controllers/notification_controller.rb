class NotificationController < ApplicationController
	include NotificationHelper

	def index
	end

	def authenticate
		send_sms(9099640670, 'authentication testing')
	end

	def send_back
		sender = params[:From]
		friends = {
			9099640670 => "Kenneth"
		}
		name = friends[sender] || "YO"
		twiml = Twilio::TwiML::Response.new do |r|
			r.Message "Hello, #{name}. Thanks for the message"
		end
		twiml.text
	end



end
