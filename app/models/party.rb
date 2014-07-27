class Party < ActiveRecord::Base
  serialize :queue, Array

  has_many     :users
  has_many     :songs
  has_many 		 :comments

  validate    :hash_tag, presence: true
  # validates_uniqueness_of :hash_tag
  #validates    :queue

end
