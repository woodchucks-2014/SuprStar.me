class Party < ActiveRecord::Base
  serialize :queue

  has_many     :users
  has_many     :songs
  has_many 		 :comments

  validate    :hash_tag, :presence => {:message => "Please enter in a hashtag to continue. ie: #SuprStar." }
  # validates_uniqueness_of :hash_tag
  #validates    :queue

end
