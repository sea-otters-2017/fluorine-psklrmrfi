class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :require_login

  private
  def require_login
    unless user_logged_in?
      flash[:notice] = "Nothing to see here!..."
      redirect_to root_path
    end
  end
end
