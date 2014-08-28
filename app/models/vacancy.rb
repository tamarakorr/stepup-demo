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

end
