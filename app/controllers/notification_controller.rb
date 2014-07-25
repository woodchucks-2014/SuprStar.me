class NotificationController < ApplicationController
	include NotificationHelper

	def index

	end

	def receive_sms
		text = read_received_sms
		arr = text.body.split(",")
		hash_tag = arr[0].strip
		name = arr[1]

		phone_number = text.from
		user = User.find_by(phone_number: phone_number)
		@party = Party.where(hash_tag: hash_tag)


		what_song = "What song do you wanna sing?"
		wrong_format = "Wrong Format. Please Try Again!
		Format: (#hashtag, name)"

		if !user
			if @party.empty?
				send_sms(phone_number, wrong_format)
			else
				user = User.create(name: name, phone_number: phone_number, party_id: @party.first.id)
				send_sms(user.phone_number, what_song)
			end
		end
	end


	def authenticate

	end

end

# first text should contain (hashtag, name)
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
