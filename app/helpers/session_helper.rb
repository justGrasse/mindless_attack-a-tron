enable :sessions

module SessionHelper
  def session_user
    User.get(session_user_id) if session_user_id
  end

  def session_user_id
    session[:user_id]
  end

  def session_login(user)
    return nil unless user
    session[:id] = user.id
  end

  def session_logout
    session.delete(:id)
  end
end

helpers SessionHelper
