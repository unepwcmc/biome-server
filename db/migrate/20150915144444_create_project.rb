class CreateProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :description, default: ''
      
      t.timestamps
    end
  end
end
