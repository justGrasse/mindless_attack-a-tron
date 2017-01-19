require 'spec_helper'

describe Deck, type: :model do
  it { should have_many( :decks_cards ) }
  it { should have_many( :cards ) }
end
