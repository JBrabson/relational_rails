class CreateAutomobiles < ActiveRecord::Migration[5.2]
  def change
    create_table :automobiles do |t|
      t.boolean :preowned
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.boolean :automatic
      t.string :engine
      t.integer :horsepower
      t.integer :cylinders
      t.string :drive_train
      t.decimal :price
      t.integer :seating_capacity
      t.references :auto_dealership, foreign_key: true

      t.timestamps
    end
  end
end
