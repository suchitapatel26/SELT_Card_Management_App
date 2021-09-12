class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :session_id
      t.string :uid
      t.integer :num_decks
      t.integer :num_players
      t.string :deck_settings
    end
  end
end
