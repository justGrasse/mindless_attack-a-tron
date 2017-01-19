class CreateDecksCards < ActiveRecord::Migration
  def change
    create_table :decks_cards do |t|
      t.integer :deck_id, null: false
      t.integer :deck_id, null: false
    end
  end
end
