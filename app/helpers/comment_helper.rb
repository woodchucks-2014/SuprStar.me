module CommentHelper

	def alchemyapi
		AlchemyAPI.search(:keyword_extraction, :text => "hello world")
	end

end
