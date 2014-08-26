require 'spec_helper'

describe Volunteer do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @volunteer = user.create_volunteer(user_id: user.id, cause: "Women", work_region: "Ghana",
      skill: "Rape Counseling", availability: "In Accra September 12-October 3. In the UK afterward.",
      service: "Counseling", remote_status: "Both", contact_mobile: "0752 555 5555",
      contact_city: "London", contact_country: "United Kingdom")
  end

  subject { @volunteer }

  it { should respond_to(:user_id) }
  it { should respond_to(:cause) }
  it { should respond_to(:work_region) }
  it { should respond_to(:skill) }
  it { should respond_to(:availability) }
  it { should respond_to(:service) }
  it { should respond_to(:remote_status) }
  it { should respond_to(:contact_mobile) }
  it { should respond_to(:contact_city) }
  it { should respond_to(:contact_country) }

  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }
  describe "when user_id is not present" do
    before { @volunteer.user_id = nil }
    it { should_not be_valid }
  end

  describe "when user_id is not present" do
    before { @volunteer.user_id = nil }
    it { should_not be_valid }
  end
end
