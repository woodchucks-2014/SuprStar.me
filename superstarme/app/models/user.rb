class User < ActiveRecord::Base

  belongs_to   :notification
  belongs_to   :party
  has_many     :songs

  validates    :name, presence: true
  validates    :phone_number, format: { with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/ ,
                           message: "Wrong Format 000-000-0000"},
                           presence: true
                           #might have to change this to account for the +1

  validates    :is_verified, presence: true

end
