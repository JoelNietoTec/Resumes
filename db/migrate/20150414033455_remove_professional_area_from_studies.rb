class RemoveProfessionalAreaFromStudies < ActiveRecord::Migration
  def change
    remove_column :studies, :professional_area_id, :integer
  end
end
