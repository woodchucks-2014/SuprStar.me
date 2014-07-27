class CommentController < ApplicationController
	skip_before_action :verify_authenticity_token
	respond_to :json
	def retrieve_comments
		@party = Party.find_by_id(1) #where to get party id from?
		@comment = @party.comments.where("created_at > ?", Time.at(params[:time].to_i)) 
		p @comment
		render json: {content: @comment }
	end
	
end
