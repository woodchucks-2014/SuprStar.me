class User < ActiveRecord::Base

  belongs_to   :notification
  belongs_to   :party
  has_many     :songs

end
