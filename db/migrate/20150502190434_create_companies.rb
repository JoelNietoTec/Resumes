class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :industry_id
      t.integer :company_type_id
      t.text :extract
      t.integer :country_id
      t.string :contact_name
      t.string :phones
      t.string :website
      t.string :logo
      t.string :email

      t.timestamps null: false
    end
  end
end
