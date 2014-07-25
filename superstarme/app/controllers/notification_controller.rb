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

	# def receive_sms
	# 	reply = params[:Body]
	# 	user_phone_number = params[:From]

	# 	user = User.find_by_phone_number(user_phone_number)

	# 	redirect_to :root
	# end



end
