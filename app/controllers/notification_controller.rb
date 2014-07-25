class NotificationController < ApplicationController
	include NotificationHelper
	
	def index

	end

def receive_sms
		text = read_first_sms
		body = text.body.split(",")
		name = body[1]
		hashtag = body[0]

		phone_number = text.from
		user = User.find_by(phone_number: phone_number)
		party = Party.find_by(hash_tag: hashtag)

		what_song = "What Song?" #to be revised

		if !user
			if party
				user = User.create(name: name, phone_number: phone_number, party: party.id)
				send_sms(user.phone_number, what_song)
			end
		end
	end

	def authenticate
		
	end
	
end