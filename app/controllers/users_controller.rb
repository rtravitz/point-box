class UsersController < ApplicationController
  before_action :require_logged_in, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:failed] = "Incorrect information. Please try again."
      render :new
    end
  end

  def show
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_logged_in
    render file: 'public/404' unless logged_in?
  end

end
