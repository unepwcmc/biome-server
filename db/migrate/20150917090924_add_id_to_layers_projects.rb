class AddIdToLayersProjects < ActiveRecord::Migration
  def change
    add_column :layers_projects, :id, :primary_key 
  end
end
