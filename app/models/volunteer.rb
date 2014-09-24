class Volunteer < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :service, presence: true
  validates :remote_status, presence: true
  validates :contact_city, presence: true
  validates :contact_country, presence: true


  def self.filtered_by(filters = {})    
    filters ||= {}
    filters.stringify_keys!
    
    records = Volunteer.where('id > ?', 0)
    
    if filters['work_region'].present?
      records = records.where("volunteers.work_region in (?)", filters['work_region'])
    end

    if filters['service'].present?
      records = records.where("volunteers.service in (?)", filters['service'])
    end

    if filters['cause'].present?
      records = records.where("volunteers.cause in (?)", filters['cause'])
    end

    records
  end

end
