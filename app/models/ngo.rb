class Ngo < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true
  validates :contact_city, presence: true
  validates :contact_country, presence: true
  validates :contact_phone, presence: true
end
