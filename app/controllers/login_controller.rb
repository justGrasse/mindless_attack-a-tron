get '/login' do
  session['oauth'] = Koala::Facebook::OAuth.new(ENV['APP_ID'], ENV['APP_SECRET'], "#{request.base_url}/callback")
  redirect session['oauth'].url_for_oauth_code()
end

get '/logout' do
  session_logout
  redirect '/decks'
end

get '/callback' do
  access_token = session['oauth'].get_access_token(params[:code])
  graph = Koala::Facebook::API.new(access_token, ENV['APP_SECRET'])
  user = User.find_or_initialize_by(facebook_id: graph.get_object("me")['id'])
  user.access_token = access_token
  user.save
  session.delete(:oauth)
  session.delete(:code)
  session_login(user)
  redirect '/decks'
end
