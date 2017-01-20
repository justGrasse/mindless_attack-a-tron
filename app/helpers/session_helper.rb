enable :sessions

module SessionHelper
  def session_user
    User.find_by_id(session_user_id)
  end

  def session_user_id
    session[:id]
  end

  def session_login(user)
    return nil unless user.is_a User
    session[:id] = user.id
  end

  def session_logout
    session.delete(:id)
  end
end

helpers SessionHelper
