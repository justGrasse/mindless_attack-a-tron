class Card < ActiveRecord::Base
  has_many :decks_cards
  has_many :decks, through: :decks_cards

  validates :card_id, presence: true



  def name
    card_data.name
  end

  def set
    MTG::Set.find(set_initials).name
  end

  def power
    card_data.power
  end

  def toughness
    card_data.toughness
  end

  def image_url
    card_data.image_url
  end

  def types
    card_data.types
  end

  # private

  def card_data
    MTG::Card.find(card_id)
  end

  def set_initials
    card_data.set
  end
end
