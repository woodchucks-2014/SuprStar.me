module NotificationHelper
	def twilio_client
    twilio_token = ENV["TWILIO_API_KEY"]
    twilio_sid = ENV["TWILIO_ACC_SID"]
    client = Twilio::REST::Client.new twilio_sid, twilio_token
	end

	def send_sms(phone_number, body)
		twilio_client.account.messages.create(
			:from => ENV["TWILIO_NUMBER"],
			:to => phone_number,
			:body => body
			)
	end


	def get_sms
		twilio_client.account.messages.list({:to => "+18454434529"}).first
	end

	def read_sms
		text = get_sms
		phone_number = text.from
		text_body = text.body

		# Search User's table by phone_number
		user = User.find_by(phone_number: phone_number)

		# Determine incoming format of text message
		verification_text = text_body[0].include?("#")
		new_song_text = text_body[0].include?("1")
		comment_text = text_body[0].include?("2")

		#Determine reception of text message
		case
		when verification_text
			text_body = text.body.split(",")
			text_body
			hash_tag = text_body[0]
			name = text_body[1]
			title_artist = text_body[2]
			party = Party.find_by_hash_tag(hash_tag)
			p party
		when new_song_text
			song_info = text_body.slice!(1..text_body.length)
			party = user.party
		when comment_text
			comment = text_body[1..text_body.length]
		else
			text_body
		end

		# Determine outgoing format of text message response
		get_ready_to_sing = 'Get ready to sing SuprStar! To sing again text 1 and then your song. To send a comment text 2 and then your comment.'
		check_format_for_hashtag = "Please try to verify party, name, artist and song again"
		did_not_recognize = "Try again SuprStar. example #SuprStar, Matt Bunday, Friday by Rebecca Black"
		second_song = "Going again SuprStar?"
		be_nice = "Comment Received"

		# Determine parameters of incoming text message
		all_parameters_met = hash_tag && name && title_artist
		user_not_verified = text_body && name && title_artist
		user_comment = user && comment
		user_sing_again = party && song_info

		# Determine which actions to take with incoming text message
		case
		when all_parameters_met
			video = find(title_artist)
			user = User.create(name: name, phone_number: phone_number,
												party_id: party.id)
			song = Song.create(name: video[:title], user_id: user.id,
												party_id: user.party.id, youtube_url: video[:ytid])
			party_queue = user.party.queue
			party_queue << song.serializable_hash
			party.update(queue: party_queue)
			send_sms(phone_number, get_ready_to_sing)
		when user_not_verified
			send_sms(phone_number, check_format_for_hashtag)
		when user_comment
			comment = text_body.slice!(1..text_body.length)
			Comment.create(content: comment , user_id: user.id, party_id: user.party.id)
			send_sms(phone_number, be_nice)
		when user_sing_again
			video = find(song_info)
			p video[:title]
			song = Song.create(name: video[:title], user_id: user.id,
												party_id: user.party.id, youtube_url: video[:ytid])
			party_queue = user.party.queue
			party_queue << song.serializable_hash
			party.update(queue: party_queue)
			send_sms(phone_number, second_song)
		else
			send_sms(phone_number, did_not_recognize)
		end
	end

end
