use OmniAuth::Strategies::Facebook, ENV['APP_ID'], ENV['APP_SECRET']

enable :sessions

get '/' do
  if session_user
    # TEST BELOW
    session_user.id.to_s + " ... " + session[:user_id].to_s
  else
    '<a href="/sign_up">create an account</a> or <a href="/sign_in">sign in with FACEBOOK</a>'

  end
end

get '/auth/facebook/callback' do
  puts '/auth/facebook/callback'
  auth = request.env["omniauth.auth"]
  p auth
  user = User.first_or_create({ uid: auth["uid"]}, {
    uid: auth["uid"],
    name: auth["info"]["name"] })
  session[:user_id] = user.id
  redirect '/'
end

get '/login' do
  redirect '/auth/facebook'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
