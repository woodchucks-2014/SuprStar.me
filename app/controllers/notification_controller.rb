class NotificationController < ApplicationController
	include NotificationHelper

	def index

	end

	def receive_sms
		text = read_received_sms
		phone_number = text.from
		arr = text.body.split(",")

		user = User.find_by(phone_number: phone_number)

		if arr[0][0].include?("#")
			hash_tag = arr[0].strip
			name = arr[1]
			party = Party.where(hash_tag: hash_tag)
		else
			song_info = arr.join
		end

		wrong_format = "Wrong Format. Please Try Again!
		Format: (#hashtag, name)"
		what_song = "You are on your way to becoming a SuprStar! What song would you like to sing?"
		confirm_song = "You are one step closer SuprStar! Get ready to sing #{song_info} !"

		if !user
			if party.empty?
				send_sms(phone_number, wrong_format)
			else
				user = User.create(name: name, phone_number: phone_number, party_id: party.first.id)
				send_sms(user.phone_number, what_song)
			end
		else
			if song_info
				Song.create(name: song_info, user_id: user.id, party_id: user.party.id)
				send_sms(user.phone_number, confirm_song)
			else
				send_sms(user.phone_number, what_song)
			end
		end
	end


	def authenticate

	end

end
