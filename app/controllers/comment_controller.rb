class CommentController < ApplicationController
	include CommentHelper
	skip_before_action :verify_authenticity_token
	respond_to :json

	def retrieve_comments
		@party = current_party #where to get party id from?
		@comments = @party.comments.where("created_at > ?", Time.at(params[:time].to_i + 1))
		@comment_size = @comments.size
		@new_comments = []
		@sentimental_score = 0
		@comments.each do |com|
			hash = {name: com.user.name, obj: com}
			@sentimental_score += (com.score * 10) #do math here
			@new_comments << hash
		end
		render json: {content: @new_comments, sentimental_score: @sentimental_score, comment_size: @comment_size}.to_json
	end

end
