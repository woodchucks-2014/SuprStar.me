class NotificationController < ApplicationController
	include NotificationHelper

	def index

	end

	def receive_sms
		text = read_first_sms
		body = text.body
		phone = text.from
		user = User.find_by(phone_number: phone)
		if !user.exists?
			User.create(name: #first part of text where next hash_tag exists)


	end

	def authenticate

	end

end


# Read
# Parse
# Verify
# Response
