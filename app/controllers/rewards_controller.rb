class RewardsController < ApplicationController
  
  def show
    @user = current_user
    @reward = Reward.find(params[:id])
    @user.purchase_reward(@reward)
    redirect_to user_path(@user)
  end

end
