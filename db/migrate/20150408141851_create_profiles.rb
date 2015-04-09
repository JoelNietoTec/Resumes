class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :forenames
      t.string :surnames
      t.string :email
      t.integer :sex_id
      t.integer :marital_status_id
      t.date :birth_date
      t.string :professional_title
      t.integer :nationality_id
      t.integer :country_id
      t.integer :province_id
      t.integer :district_id
      t.integer :township_id
      t.string :address
      t.string :phone_number
      t.string :skills
      t.float :wage_aspiration
      t.text :presentation

      t.timestamps null: false
    end
  end
end
