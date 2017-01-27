module SessionsHelper

  def set_user(user)
    session[:user_id] = user.id
  end

  def user_logged_in?
    return false unless User.first
    return true if session[:user_id] == User.first.id #The user is the only user
    false
  end

  def logout
    session[:user_id] = nil
    session[:admin] = false
  end

end
