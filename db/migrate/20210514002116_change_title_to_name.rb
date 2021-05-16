class ChangeTitleToName < ActiveRecord::Migration[5.2]
  def change
    rename_column :teams, :title, :name
  end
end
