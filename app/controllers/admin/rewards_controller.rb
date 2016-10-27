class Admin::RewardsController < Admin::BaseController
  before_action :set_reward, only: [:edit, :update, :destroy]

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      redirect_to admin_rewards_path
    else
      flash[:error] = "Insufficient information. Please complete all fields."
      render :new
    end
  end

  def edit
  end

  def update
    if @reward.update(reward_params)
      redirect_to admin_rewards_path
    else
      flash[:error] = "Insufficient information. Please complete all fields."
      render :edit
    end
  end

  def destroy
    @reward.delete
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :cost, :image_link)
  end

  def set_reward
    @reward = Reward.find(params[:id])
  end
end
