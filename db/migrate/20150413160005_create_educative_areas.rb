class CreateEducativeAreas < ActiveRecord::Migration
  def change
    create_table :educative_areas do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
