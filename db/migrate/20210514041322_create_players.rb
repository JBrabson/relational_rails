class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.references :team, foreign_key: true
      t.string :name
      t.integer :age
      t.boolean :healthy
      t.timestamps
    end
  end
end
