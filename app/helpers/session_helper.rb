enable :sessions

module SessionHelper
  def session_user
    User.find_by(access_code: session_access_code) if session_access_code
  end

  def session_access_code
    session[:access_token]
  end

  def session_logout
    session[:oauth] = nil
    session[:access_token] = nil
  end
end

helpers SessionHelper
