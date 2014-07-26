class User < ActiveRecord::Base

  belongs_to   :party
  has_many     :songs

  validates_presence_of    :name, :phone_number
  validates_format_of      :phone_number, :with => /\A\+1\d{10}\z/, :allow_nil => true, message: "Number must consisits of +1 followed by a 10 digit number, i.e. +15551234567"

end
