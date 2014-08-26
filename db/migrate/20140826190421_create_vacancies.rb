class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.integer :ngo_id
      t.string :service
      t.string :skill
      t.string :work_region
      t.string :remote_status
      t.string :when_needed
      t.string :desc
      t.string :title
      t.boolean :is_active

      t.timestamps
    end
    add_index :vacancies, [:ngo_id, :created_at]
    add_index :vacancies, [:service]
    add_index :vacancies, [:skill]
    add_index :vacancies, [:work_region]
    add_index :vacancies, [:remote_status]
    add_index :vacancies, [:is_active]
  end
end
