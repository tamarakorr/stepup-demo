class Vacancy < ActiveRecord::Base
  before_save {
    # Fill in latitude and longitude
    # TODO move latitude/longitude logic to helper function
    c = Country::find_country_by_name(work_region)
    if ! (c.nil?)
      lat = c.latitude.to_f
      if c.latitude.ends_with?('S')
        lat *= -1
      end

      long = c.longitude.to_f
      if c.longitude.ends_with?('W')
        long *= -1
      end

      self.latitude = lat
      self.longitude = long
    end
  }

  belongs_to :ngo
  
  validates :ngo_id, presence: true
  validates :title, presence: true
  validates :service, presence: true
  validates :remote_status, presence: true
  validates :work_region, presence: true

  # Doesn't work
  #acts_as_gmappable
  #def gmaps4rails_address
  #  self.work_region
  #end

  def self.sortable_by?(field_name)
    # TODO Cover this in rspec
    return false if field_name.nil?
    return true if column_names.include?(field_name)
    # In case of sorting on NGO's fields, the field will contain 'ngo.' appended to it.    
    #   e.g: 'ngos.name'. So remove that and send to NGO model.
    return true if Ngo.sortable_by?(field_name.split('.').last) 
  end

  def self.filtered_by(filters = {})
    records = Vacancy.eager_load(:ngo)
    filters.stringify_keys!
    
    if filters['work_region'].present?
      records = records.where("vacancies.work_region in (?)", filters['work_region'])
    end

    if filters['service'].present?
      records = records.where("vacancies.service in (?)", filters['service'])
    end

    if filters['ngos.name'].present?
      records = records.where("ngos.name in (?)", filters['ngos.name'])
    end

    records
  end

end
