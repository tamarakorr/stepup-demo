class Vacancy < ActiveRecord::Base
  belongs_to :ngo
  
  validates :ngo_id, presence: true
  validates :title, presence: true
  validates :service, presence: true
  validates :remote_status, presence: true

  # Doesn't work
  #acts_as_gmappable
  #def gmaps4rails_address
  #  self.work_region
  #end

end
