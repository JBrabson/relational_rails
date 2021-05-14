class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.bigint :music_store_id
      t.string :kind
      t.boolean :rent_to_own
      t.integer :cost
    end
  end
end
