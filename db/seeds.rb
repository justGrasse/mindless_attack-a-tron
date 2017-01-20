Deck.delete_all
Card.delete_all
DecksCard.delete_all

MTG::Card.where(set: 'ktk').all.each do |card|
  Card.create!( card_id: card.id )
end

10.times do
  deck = Deck.create!(  name: Faker::Team.name,
                    description: Faker::Hipster.paragraph(2, true, 4) )
  20.times do
    deck.cards << Card.all.sample
  end
end
