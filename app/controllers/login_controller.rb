get '/login' do
  session['oauth_id'] = Koala::Facebook::OAuth.new(ENV['APP_ID'], ENV['APP_SECRET'], "http://localhost:9393/callback")
  redirect session['oauth_id'].url_for_oauth_code()
end

get '/logout' do
  session_logout
  redirect '/decks'
end

get '/callback' do
  session['access_token'] = session['oauth_id'].get_access_token(params[:code])
  redirect '/decks'
end
