class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :card_id, null: false
      t.boolean :is_commander, default: false

      t.timestamps null: false
    end
  end
end
