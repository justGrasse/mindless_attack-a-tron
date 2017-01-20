class AddAttributesToCardsTable < ActiveRecord::Migration
  def change
    add_column :cards, :name, :string, null: false
    add_column :cards, :power, :integer
    add_column :cards, :toughness, :integer
    add_column :cards, :image_url, :string
    add_column :cards, :set_id, :integer
  end
end
