class AddSlugToVacants < ActiveRecord::Migration
  def change
    add_column :vacants, :slug, :string
    add_index :vacants, :slug, unique: true
  end
end
