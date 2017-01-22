class Deck < ActiveRecord::Base
  has_many :decks_cards
  has_many :cards, through: :decks_cards
  belongs_to :creator, class_name: :User

  def cards_by_type(type)
    cards.select do |card|
      card.types.include?(type)
    end
  end

  def card_quantity(match_card)
    matches = cards.select { |card| card == match_card }
    return nil if matches.empty?
    matches.count
  end

end
