require 'rails_helper'

RSpec.describe Song, :type => :model do

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end

end
