class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to rewards_path
    else
      flash[:error] = "Insufficient information. Please complete all fields."
      render :new
    end
  end

  def edit
    @reward = Reward.find(params[:id])
  end

  def update
    @reward = Reward.find(params[:id])
    if @reward.update(reward_params)
      redirect_to rewards_path
    else
      flash[:error] = "Insufficient information. Please complete all fields."
      render :edit
    end
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost, :image_link)
  end
end
