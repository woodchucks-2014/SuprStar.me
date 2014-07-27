class CommentController < ApplicationController
	def index
		@comments = Song.where("party_id = ? and created_at > ?", 1, Time.at(params[:after].to_i + 1))
	end

end
