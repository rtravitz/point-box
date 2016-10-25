class SessionsController < ApplicationController
  def login
  end

  def authenticate
    @user = User.authenticate(params[:user_email]) 
  end

  def logout
  end
end
