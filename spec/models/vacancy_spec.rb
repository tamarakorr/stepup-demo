require 'spec_helper'
require 'request_helper'

describe Vacancy do
  describe ".filters" do

    before(:all){
      clean!
    }

    let!(:ngos){[
      FactoryGirl.create(:ngo, :name => 'ngo 1'),
      FactoryGirl.create(:ngo, :name => 'ngo 2'),
      FactoryGirl.create(:ngo, :name => 'ngo 3')
    ]}

    let!(:vacancies){[
      FactoryGirl.create(
        :vacancy,
        :work_region => 'India',
        :service => 'Service 1',
        :ngo => ngos[0]
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'UK',
        :service => 'Service 2',
        :ngo => ngos[1]
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'India',
        :service => 'Service 3',
        :ngo => ngos[0]
      ),
      FactoryGirl.create(
        :vacancy,
        :work_region => 'US',
        :service => 'Service 1',
        :ngo => ngos[2]
      )
    ]}

    context "when no filters are passed" do
      it "should return all records" do
        results = Vacancy.filtered_by
        results.count.should be_eql(vacancies.size)
      end
    end

    context "work_region filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Vacancy.filtered_by({ :work_region => [] })
          results.count.should be_eql(vacancies.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Vacancy.filtered_by({
            :work_region => [
              "India",
              "UK"
            ]
          })
          results.pluck(:id).should =~ vacancies[0..2].map(&:id)
        end
      end
    end

    context "service filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Vacancy.filtered_by({ :service => [] })
          results.count.should be_eql(vacancies.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Vacancy.filtered_by({
            :service => [
              "Service 1",
              "Service 2"
            ]
          })
          results.pluck(:id).should =~ vacancies.select{ |vacancy|
            ["Service 1", "Service 2"].include?(vacancy.service)
          }.map(&:id)
        end
      end
    end

    context "ngos.name filter" do
      context "when the filter is empty" do
        it "should return all records" do
          results = Vacancy.filtered_by({ "ngos.name" => [] })
          results.count.should be_eql(vacancies.size)
        end
      end

      context 'when the filter is NOT empty' do
        it "should return matching records" do
          results = Vacancy.filtered_by({
            "ngos.name" => [
              "ngo 2",
              "ngo 3"
            ]
          })
          results.pluck(:id).should =~ vacancies.select{ |vacancy|
            ["ngo 2", "ngo 3"].include?(vacancy.ngo.name)
          }.map(&:id)
        end
      end
    end

    context "when multiple filters are passed togethter" do
      it "should return the matching records" do
        results = Vacancy.filtered_by({
          :service => [
            "Service 1",
            "Service 2"
          ],
          :work_region => [
            "India",
            "UK"
          ],
          :'ngos.name' => [
            "ngo 2",
            "ngo 3"
          ]
        })

        results.pluck(:id).should =~ [vacancies[1].id]
      end
    end
  end
end
