require 'spec_helper'
require 'request_helper'

describe VacanciesController do

  describe "GET index" do

    before(:all){
      clean!
    }

    let!(:vacancies){[
      FactoryGirl.create(:vacancy, :work_region => 'India', :service => 'Serivce 1'),
      FactoryGirl.create(:vacancy, :work_region => 'US', :service => 'Serivce 2'),
      FactoryGirl.create(:vacancy, :work_region => 'Germany', :service => 'Serivce 3'),
      FactoryGirl.create(:vacancy, :work_region => 'US', :service => 'Serivce 4')
    ]}

    context "when there are no sort parameters" do
      it 'should get a list of all the vacancies in a instance variable sorted asc with `service` and render the view.' do
        get 'index'
        response.should be_success
        assigns(:vacancies).count.should be_eql(4)
        assigns(:vacancies).pluck(:service)
          .should == vacancies.map(&:service).sort
      end
    end

    context "when there are sort paraments" do
      it "should fetch vacancies within the specified sort orders" do
        get 'index', 
            :sort => 'work_region',
            :direction => 'desc'
        response.should be_success
        assigns(:vacancies).pluck(:work_region)
          .should == vacancies.map(&:work_region).sort.reverse
      end
    end
  end
end