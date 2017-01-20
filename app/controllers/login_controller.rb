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
  user = User.find_or_create_by(access_token: access_token)
  session.delete(:oauth)
  session.delete(:access_token)
  session_login(user)
  redirect '/decks'
end

