class CreateLayersProjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :layers_projects, id: false do |t|
      t.integer :project_id
      t.integer :layer_id
    end
 
    add_index :layers_projects, :project_id
    add_index :layers_projects, :layer_id
  end
end
