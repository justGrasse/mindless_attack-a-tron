class User < ActiveRecord::Base
  has_many :decks
  has_many :cards, through: :decks

  validates :access_token, presence: true
  validates :oauth_id, presence: true
  validates :expires_at, presence: true

  before_validation :store_user_data, on: :create

  def store_user_data

  end
end


t.string :access_token, null: false
t.string :ouath, null: false
t.timestamp :expires_at, null: false
