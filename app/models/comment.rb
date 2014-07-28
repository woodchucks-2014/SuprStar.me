class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :party

	def analyze_sentiment
		AlchemyAPI.search(:sentiment_analysis, :text => self.content)
	end
end
