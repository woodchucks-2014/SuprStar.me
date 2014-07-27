class Party < ActiveRecord::Base
  serialize :queue, Array
  
  has_many     :users
  has_many     :songs

  validates    :hash_tag, presence: true, uniqueness: true
  #validates    :queue

end
