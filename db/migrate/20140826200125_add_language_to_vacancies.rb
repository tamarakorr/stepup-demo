class AddLanguageToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :language, :string
  end
end
