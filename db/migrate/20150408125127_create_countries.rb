class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :esp_name
      t.string :abbreviation
      t.string :code

      t.timestamps null: false
    end
  end
end
