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

# first text should contain (name, hashtag)
# check if phone_number is in database
# if not user,
	#check format of text for hashtag
		#if hashtag exists
			#create user with (name, phone, hashtag)
			#send text back saying: "you've been authenticated!, what song buddy?"
		#else
			# send sms please specify what party you are in
# elsif user
	#check format of text for artist and song
		#if artist and song exists
			#save song to
