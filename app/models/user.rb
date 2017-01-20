class User < ActiveRecord::Base
  has_many :decks
  has_many :cards, through: :decks

  validates :access_token, presence: true
  validates :oauth_id, presence: true
  validates :expires_at, presence: true

  before_validation :store_user_data, on: :create

  def name
    graph.get_object("me")['name']
  end

  def graph
    Koala::Facebook::API.new(access_token)
  end

  def store_user_data

  end
end