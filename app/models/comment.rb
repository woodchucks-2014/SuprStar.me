class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :party

  def analyze
  	self.sentiment("text", self.content)
  end
end
