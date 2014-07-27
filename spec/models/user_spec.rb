require 'rails_helper'

RSpec.describe User, :type => :model do

	context "associations" do
		it { should belong_to(:party) }
		it { should have_many(:songs) }
	end

	context "validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:phone_number) }
	end
end
