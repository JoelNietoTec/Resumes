class CreatePostulationStatuses < ActiveRecord::Migration
  def change
    create_table :postulation_statuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
