require 'spec_helper'

describe Card, type: :model do
  it { should have_many( :decks_cards ) }
  it { should have_many( :decks ) }
end

describe Card, type: :model do
  it { should validate_presence_of( :card_id ) }
end

