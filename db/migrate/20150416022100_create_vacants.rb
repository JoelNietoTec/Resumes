class CreateVacants < ActiveRecord::Migration
  def change
    create_table :vacants do |t|
      t.string :position
      t.integer :professional_area_id
      t.integer :country_id
      t.integer :province_id
      t.integer :district_id
      t.string :keywords
      t.date :due_date
      t.integer :job_type_id
      t.float :wage_offer
      t.text :job_description
      t.boolean :active

      t.timestamps null: false
    end
  end
end
