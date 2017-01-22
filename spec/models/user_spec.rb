require 'spec_helper'

describe User, type: :model do
  it { should have_many( :decks ) }
  it { should have_many( :cards ) }
end

describe User, type: :model do
  it { should validate_presence_of( :facebook_id ) }
  it { should validate_uniqueness_of( :facebook_id ) }
  it { should validate_presence_of( :access_token ) }
end

