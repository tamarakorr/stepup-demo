class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.integer :user_id
      t.string :cause
      t.string :work_region
      t.string :skill
      t.string :availability
      t.string :service
      t.string :remote_status
      t.string :contact_mobile
      t.string :contact_city
      t.string :contact_country

      t.timestamps
    end
    add_index :volunteers, [:user_id, :created_at]
    add_index :volunteers, [:cause]
    add_index :volunteers, [:work_region]
    add_index :volunteers, [:service]
    add_index :volunteers, [:remote_status]
  end
end
