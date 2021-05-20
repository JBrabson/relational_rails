class AddMusicStoreToInstruments < ActiveRecord::Migration[5.2]
  def change
    add_reference :instruments, :music_store, foreign_key: true
  end
end
