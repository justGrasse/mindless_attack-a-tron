get '/decks' do
  erb :'decks/index'
end

get '/decks/new' do
  erb :'decks/new'
end

post '/decks' do
  @deck = Deck.new params[:deck]
  if @deck.save
    redirect '/decks'
  else
    @errors = @deck.errors.full_messages
    erb :'decks/new'
  end
end

get '/decks/:id' do
  @deck = Deck.find params[:id]
  if @deck
    erb :'decks/show'
  else
    redirect :'/decks'
  end
end


