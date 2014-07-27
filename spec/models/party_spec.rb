require 'rails_helper'

RSpec.describe Party, :type => :model do

  context "associations" do
    it { should have_many(:users) }
    it { should have_many(:songs) }
  end

  context "validations" do
    it { should validate_presence_of(:hash_tag) }
    it { should validate_uniqueness_of(:hash_tag) }
  end
end
