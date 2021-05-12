class CreateAutoDealerships < ActiveRecord::Migration[5.2]
  def change
    create_table :auto_dealerships do |t|
      t.string :name
      t.boolean :preowned_sales
      t.boolean :foreign_inventory
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
