Deck.delete_all
Card.delete_all
DecksCard.delete_all

MTG::Card.where(set: 'ktk').all.each do |card|
  Card.create!( card_id: card.id )
end

10.times do |i|
  deck = Deck.create!(  name: "Deck_#{ i + 1 }",
                    description: "Description of Deck_#{ i + 1 }" )
  20.times do
    deck.cards << Card.all.sample
  end
end
