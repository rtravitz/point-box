class SessionsController < ApplicationController
  def login
  end

  def authenticate
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.password_digest == params[:session][:password]
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      #either doesn't exist or password is incorrect
    end
  end

  def logout
  end
end
