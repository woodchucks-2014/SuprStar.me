class Song < ActiveRecord::Base
  include ActiveModel::Serialization

  attr_accessor :name, :ytid

  def attributes
    {'name' => nil, 'youtube_url' => nil}
  end

  belongs_to  :user
  belongs_to  :party

  validates    :name, :presence => {:message => "Please enter in a song to continue" }
  # validates    :youtube_url, presence: true
  # validates    :lyrics

end
