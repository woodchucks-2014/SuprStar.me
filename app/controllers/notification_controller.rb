class NotificationController < ApplicationController
	include NotificationHelper

	def index

	end

	def receive_sms
		text = read_received_sms
		phone_number = text.from
		arr = text.body #.split(",")
		user = User.find_by(phone_number: phone_number)


		if arr[0].include?("#")
			arr = text.body.split(",")
			hash_tag = arr[0].strip
			name = arr[1]
			title_artist = arr[2]
			party = Party.where(hash_tag: hash_tag)

		elsif arr[0].include?("1")
			song_info = arr
			party = user.party
		elsif arr[0].include?("2")
			comment = arr
		elsif
			text_body = arr
		end



		get_ready_to_sing = 'Get ready to sing SuprStar!
												To sing again text 1 and then your song.
												To send a comment text 2 and then your comment.'
		check_format_for_hashtag = "Please try to verify party, name, artist and song again"
		did_not_recognize = "Try again SuprStar. example #SuprStar, Matt Bunday, Friday by Rebecca Black"
		second_song = "Going again SuprStar?"
		be_nice = "..Temporary Message.."


		if hash_tag && name && title_artist
				video = find(title_artist)
				user = User.create(name: name, phone_number: phone_number, party_id: party.first.id)
				song = Song.create(name: video[:title], user_id: user.id, party_id: user.party.id, youtube_url: video[:ytid])
				party_queue = user.party.queue
				party_queue << song
				party.first.update(queue: party_queue)
				send_sms(phone_number, get_ready_to_sing)

		elsif text_body && name && title_artist
			send_sms(phone_number, check_format_for_hashtag)

		elsif user && comment
			send_sms(phone_number, be_nice)

				Comment.create(content: hash_tag, user_id: user.id, party_id: user.party.id)

		elsif party && song_info
			video = find(song_info)
			song = Song.create(name: video[:title], user_id: user.id, party_id: user.party.id, youtube_url: video[:ytid])
			party_queue = user.party.queue
			party_queue << song
			p party
			party.update(queue: party_queue)

			send_sms(phone_number, second_song)
		elsif
			send_sms(phone_number, did_not_recognize)

		end
	end

	def authenticate

	end

end
