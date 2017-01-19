class Card < ActiveRecord::Base
  validates :card_id, presence: true
end
