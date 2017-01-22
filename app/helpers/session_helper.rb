enable :sessions

module SessionHelper
  def session_user
    User.find_by_id(session_user_id) if session_user_id
  end

  def session_user_id
    session[:user_id]
  end

  def session_login(user)
    return nil unless user
    session[:user_id] = user.id
  end

  def session_logout
    session.delete(:user_id)
  end
end

helpers SessionHelper
