class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user
      login(user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    if logged_in?
      logout(current_user)
    else
      flash.now[:errors] = ["Cannot log out"]
      render :new
    end
  end
end
