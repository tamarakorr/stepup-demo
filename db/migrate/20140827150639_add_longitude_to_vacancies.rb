class AddLongitudeToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :longitude, :decimal
  end
end
