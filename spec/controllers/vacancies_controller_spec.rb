require 'spec_helper'
require 'request_helper'

describe VacanciesController do

  describe "GET index" do

    before(:all){
      clean!
    }

    let!(:vacancies){[
      FactoryGirl.create(
        :vacancy,
        :work_region => 'India',
        :service => 'Serivce 1',
        :ngo => FactoryGirl.create(:ngo, :name => 'ngo 4')
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'US',
        :service => 'Serivce 2',
        :ngo => FactoryGirl.create(:ngo, :name => 'ngo 1')
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'Germany',
        :service => 'Serivce 3',
        :ngo => FactoryGirl.create(:ngo, :name => 'ngo 3')
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'US',
        :service => 'Serivce 4',
        :ngo => FactoryGirl.create(:ngo, :name => 'ngo 2')
      )
    ]}

    context "when there are no sort parameters" do
      it 'should fetch all vacancies into a instance variable sorted asc with `service`' do
        get 'index'
        response.should be_success
        assigns(:vacancies).count.should be_eql(4)
        assigns(:vacancies).pluck(:service)
          .should == vacancies.map(&:service).sort
      end
    end

    context "when there are sort paraments" do
      it "should fetch vacancies within the specified sort orders into a instance variable" do
        get 'index', 
            :sort => 'work_region',
            :direction => 'desc'
        response.should be_success
        assigns(:vacancies).pluck(:work_region)
          .should == vacancies.map(&:work_region).sort.reverse
      end

      context "sorting by ngo's name" do
        it "should sort based on NGO's name" do
          get 'index',
              :sort => 'ngos.name',
              :direction => 'asc'
          response.should be_success
          assigns(:vacancies).pluck('ngos.name').should == vacancies.map{ |vacancy|
            vacancy.ngo.name
          }.sort
        end
      end
    end
  end
end