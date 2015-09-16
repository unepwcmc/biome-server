class CreateField < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name, null: false
      t.string :description, default: ''
      t.integer :layer_id
      t.integer :project_id 

      t.timestamps
    end
  end
end
