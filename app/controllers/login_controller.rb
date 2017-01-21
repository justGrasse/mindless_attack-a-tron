get '/login' do
  session['oauth'] = Koala::Facebook::OAuth.new(ENV['APP_ID'], ENV['APP_SECRET'], "http://localhost:9393/callback")
  redirect session['oauth'].url_for_oauth_code()
end

get '/logout' do
  session_logout
  redirect '/decks'
end

get '/callback' do
  access_token = session['oauth'].get_access_token(params[:code])
  puts 'access_token'
  p access_token
  puts 'koala_oauth'
  p session['oauth']
  graph = Koala::Facebook::API.new(access_token, ENV['APP_SECRET'])
  puts 'graph'
  p graph

  user = User.find_or_create_by(access_token: access_token)
  session.delete(:oauth)
  session.delete(:access_token)
  session_login(user)
  redirect '/decks'
end

