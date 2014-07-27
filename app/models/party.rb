class Party < ActiveRecord::Base
  serialize :queue, Array
  
  has_many     :users
  has_many     :songs
  has_many 		 :comments

  validates    :hash_tag, presence: true, uniqueness: true
  #validates    :queue

end
