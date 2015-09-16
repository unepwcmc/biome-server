class CreateLayer < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :name, null: false
      t.string :description, default: ''
      
      t.timestamps
    end
  end
end
