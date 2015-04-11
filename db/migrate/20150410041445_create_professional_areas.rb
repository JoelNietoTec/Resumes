class CreateProfessionalAreas < ActiveRecord::Migration
  def change
    create_table :professional_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
