require 'spec_helper'
require "request_helper"

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

  describe ".filtered_by" do
    before(:each){
      clean!(['volunteers'])
    }

    let!(:volunteers){[
      FactoryGirl.create(
        :volunteer,
        :work_region => 'India',
        :service => 'Service 1',
        :cause => 'Cause 0'
      ),
      FactoryGirl.create(
        :volunteer,
        :work_region => 'UK',
        :service => 'Service 2',
        :cause => 'Cause 1'
      ),
      FactoryGirl.create(
        :volunteer,
        :work_region => 'India',
        :service => 'Service 3',
        :cause => 'Cause 0'
      ),
      FactoryGirl.create(
        :volunteer,
        :work_region => 'US',
        :service => 'Service 1',
        :cause => 'Cause 2'
      )
    ]}

    context "when no filters are passed" do
      it "should return all records" do
        results = Volunteer.filtered_by
        # debugger
        results.count.should be_eql(volunteers.size)
      end
    end

    context "work_region filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Volunteer.filtered_by({ :work_region => [] })
          results.count.should be_eql(volunteers.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Volunteer.filtered_by({
            :work_region => [
              "India",
              "UK"
            ]
          })
          results.pluck(:id).should =~ volunteers[0..2].map(&:id)
        end
      end
    end

    context "service filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Volunteer.filtered_by({ :service => [] })
          results.count.should be_eql(volunteers.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Volunteer.filtered_by({
            :service => [
              "Service 1",
              "Service 2"
            ]
          })
          results.pluck(:id).should =~ volunteers.select{ |volunteer|
            ["Service 1", "Service 2"].include?(volunteer.service)
          }.map(&:id)
        end
      end
    end

    context "cause filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Volunteer.filtered_by({ :cause => [] })
          results.count.should be_eql(volunteers.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Volunteer.filtered_by({
            :cause => [
              "Cause 2",
              "Cause 3"
            ]
          })
          results.pluck(:id).should =~ volunteers.select{ |volunteer|
            ["Cause 2", "Cause 3"].include?(volunteer.cause)
          }.map(&:id)
        end
      end
    end

    context "when multiple filters are passed togethter" do
      it "should return the matching records" do
        results = Volunteer.filtered_by({
          :service => [
            "Service 1",
            "Service 2"
          ],
          :work_region => [
            "India",
            "UK"
          ],
          :cause => [
            "Cause 1",
            "Cause 3"
          ]
        })

        results.pluck(:id).should =~ [volunteers[1].id]
      end
    end
  end

end
