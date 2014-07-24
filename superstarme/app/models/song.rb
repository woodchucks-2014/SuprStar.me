class Song < ActiveRecord::Base

  belongs_to  :user
  belongs_to  :party

  validates    :name, presence: true
  validates    :youtube_url, presence: true
  # validates    :lyrics

end
