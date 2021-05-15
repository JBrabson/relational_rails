class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :kind
      t.boolean :rent_to_own
      t.integer :cost

      t.timestamps
    end
  end
end
