class AddLatitudeToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :latitude, :decimal
  end
end
