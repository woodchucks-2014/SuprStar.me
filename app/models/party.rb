class Party < ActiveRecord::Base
  serialize :queue

  has_many     :users
  has_many     :songs
  has_many 		 :comments

  validates    :hash_tag, :presence => {:message => "Please enter in a hashtag to continue. ie: #SuprStar." }
  #validates   :hash_tag, uniqueness: true

end
