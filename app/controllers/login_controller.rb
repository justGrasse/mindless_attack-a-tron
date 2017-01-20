  get '/' do
    if session['access_token']
      'You are logged in! <a href="/logout">Logout</a>'
    else
      '<a href="/login">Login</a>'
    end
  end

  get '/login' do
    session['oauth'] = Koala::Facebook::OAuth.new(ENV['APP_ID'], ENV['APP_SECRET'], "http://localhost:9393/callback")
    redirect session['oauth'].url_for_oauth_code()
  end

  get '/logout' do
    session_logout
    redirect '/decks'
  end

  get '/callback' do
    session['access_token'] = session['oauth'].get_access_token(params[:code])
    redirect '/decks'
  end
