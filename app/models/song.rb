class Song < ActiveRecord::Base
  include ActiveModel::Serialization

  attr_accessor :name, :ytid

  def attributes
    {'name' => nil, 'youtube_url' => nil}
  end

  belongs_to  :user
  belongs_to  :party

  validates    :name, presence: true  


end
