class SessionsController < ApplicationController
  def login
  end

  def authenticate
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.admin?
        redirect_to admin_user_path(@user)
      else
        redirect_to user_path(@user)
      end
    else
      flash[:error] = "Incorrect login information. Please try again."
      render :login
    end
  end

  def logout
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to homepage_index_path
  end
end
