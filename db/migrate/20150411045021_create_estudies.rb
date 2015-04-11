class CreateEstudies < ActiveRecord::Migration
  def change
    create_table :estudies do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :institution
      t.string :title
      t.integer :education_level_id
      t.integer :professional_area_id
      t.integer :begin_year
      t.integer :end_year
      t.boolean :finished

      t.timestamps null: false
    end
  end
end
