class Card < ActiveRecord::Base
  has_many :decks_cards
  has_many :decks, through: :decks_cards

  validates :card_id, presence: true
end
