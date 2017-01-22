class User < ActiveRecord::Base
  has_many :decks, foreign_key: :creator_id
  has_many :cards, through: :decks

  validates :facebook_id, presence: true, uniqueness: true
  validates :access_token, presence: true

  before_validation :get_facebook_id, on: :create

  def name
    graph.get_object("me")['name']
  end

  private

  def graph
    Koala::Facebook::API.new(access_token, ENV['APP_SECRET'])
  end

  def get_facebook_id
    self.facebook_id = graph.get_object("me")['id']
  end

end
