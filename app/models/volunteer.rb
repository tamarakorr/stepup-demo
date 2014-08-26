class Volunteer < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true
  validates :service, presence: true
  validates :remote_status, presence: true
  validates :contact_city, presence: true
  validates :contact_country, presence: true
end