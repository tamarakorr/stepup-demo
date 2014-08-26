class CreateNgos < ActiveRecord::Migration
  def change
    create_table :ngos do |t|
      t.integer :user_id
      t.string :name
      t.string :contact_city
      t.string :contact_country
      t.string :contact_phone

      t.timestamps
    end
    add_index :ngos, [:user_id]
    add_index :ngos, [:name]
  end
end
