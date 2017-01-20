get '/cards/:id' do
  @card = Card.find_by_id params[:id]
  redirect '/decks' unless @card
  erb :'cards/show'
end
