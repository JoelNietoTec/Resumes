class CreatePostulations < ActiveRecord::Migration
  def change
    create_table :postulations do |t|
      t.references :vacant, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.integer :postulation_status_id

      t.timestamps null: false
    end
  end
end
