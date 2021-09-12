class CreateCards < ActiveRecord::Migration[4.2]
  def change
    create_table :cards do |t|
      t.string :card_value
      t.string :card_suit
      t.integer :pile_id
      t.boolean :visible
    end
  end
end
