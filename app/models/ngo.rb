class Ngo < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true
  validates :contact_city, presence: true
  validates :contact_country, presence: true
  validates :contact_phone, presence: true

  has_many :vacancy, dependent: :destroy         # Zero or more

  def self.sortable_by?(field_name)
    # TODO duplication of this code is possible in all models. 
    #   Should keep it in common place
    return false if field_name.nil?
    return true if column_names.include?(field_name)
  end
end
