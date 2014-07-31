class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :party

  def analyze_sentiment
    results = AlcemyAPI.search(:sentiment_analysis, :text => self.content)
    self.score = results["score"].to_i
    self.save
  end
end
