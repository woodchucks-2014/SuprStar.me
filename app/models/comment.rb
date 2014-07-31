class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :party

  # before_save :analyze_sentiment

  def analyze_sentiment
    p results = AlchemyAPI.search(:sentiment_analysis, :text => self.content)
    p self.score = results["score"].to_i
    self.save
  end
end
