class CreateFieldValue < ActiveRecord::Migration
  def change
    create_table :field_values do |t|
      t.string :name, null: false
      t.string :description, default: ''
      t.integer :value
      t.integer :field_id

      t.timestamps
    end
  end
end
