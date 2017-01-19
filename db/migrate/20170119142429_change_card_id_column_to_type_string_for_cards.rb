class ChangeCardIdColumnToTypeStringForCards < ActiveRecord::Migration
  def change
    change_column :cards, :card_id, :string
    add_index :cards, :card_id, unique: true
  end
end
