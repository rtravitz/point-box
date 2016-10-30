class Admin::UsersController < Admin::BaseController
  def show
    @user = User.find(params[:id])
  end

  def assign
  end

  def update
    @user = User.find(params[:user].to_i)
    @user.update(points: (@user.points + params[:points].to_i))
    flash[:success] = "Updated #{@user.name}'s points with #{params[:points]}!"
    redirect_to admin_assign_points_path
  end
  
end
