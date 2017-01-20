class Card < ActiveRecord::Base
  has_many :decks_cards
  has_many :decks, through: :decks_cards

  validates :card_id, presence: true

  before_validation :store_card_data, on: :create

  def set
    MTG::Set.find(set_initials).name
  end

  def types
    card_data.types
  end

  # private

  def set_initials
    card_data.set
  end

  def store_card_data
    card_data = MTG::Card.find(self.card_id)
    self.name = card_data.name
    self.power = card_data.power
    self.toughness = card_data.toughness
    self.image_url = card_data.image_url
  end

end
