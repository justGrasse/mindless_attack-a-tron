class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, default: 'untitled'
      t.string :description

      t.timestamps null: false
    end
  end
end
