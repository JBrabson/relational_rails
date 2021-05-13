class CreateMusicStores < ActiveRecord::Migration[5.2]
  def change
    create_table :music_stores do |t|
      t.string :name
      t.boolean :rents
      t.integer :lesson_cost

      t.timestamps
    end
  end
end
