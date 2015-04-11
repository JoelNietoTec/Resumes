class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.references :profile, index: true, foreign_key: true
      t.string :company
      t.string :position
      t.integer :professional_area_id
      t.float :starting_salary
      t.float :final_salary
      t.date :begin_date
      t.date :end_date
      t.text :job_description

      t.timestamps null: false
    end
  end
end
