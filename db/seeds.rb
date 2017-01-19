Deck.delete_all
Card.delete_all
DecksCard.delete_all

khans = MTG::Set.find('ktk')

10.times do
  deck = Deck.create!(  name: Faker::Team.name,
                    description: Faker::Hipster.paragraph(2, true, 4) )
  20.times do
    deck.cards << Card.create!( card_id: rand(1..100) )
  end
end
