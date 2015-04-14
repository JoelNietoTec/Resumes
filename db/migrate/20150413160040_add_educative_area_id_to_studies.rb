class AddEducativeAreaIdToStudies < ActiveRecord::Migration
  def change
    add_column :studies, :educative_area_id, :integer
  end
end
