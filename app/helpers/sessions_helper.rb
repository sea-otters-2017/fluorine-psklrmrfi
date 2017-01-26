module SessionsHelper
  def set_user(user)
    session[user_id] = user.id
  end

  def user_logged_in?
    return true if session[user_id] == User.first.id #The user is the only user
    false
  end

end
