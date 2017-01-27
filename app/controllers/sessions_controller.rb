class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
  end

  def create
    user = User.first
    if user && user.authenticate(params[:session][:password])
      set_user(user)
      redirect_to robots_path
    else
      redirect_to root_path, notice: "Not a website! Go away."
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Nothing to see here!..."
  end

end
