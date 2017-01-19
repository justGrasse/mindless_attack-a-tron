class Deck < ActiveRecord::Base
  has_many :decks_cards
  has_many :cards, through: :decks_cards

  def cards_by_type(type)
    cards.select do |card|
      card.types.include?(type)
    end
  end

end
