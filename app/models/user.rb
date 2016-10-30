class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates_confirmation_of :password
  enum role: [:default, :admin]
  has_many :users_rewards
  has_many :rewards, through: :users_rewards

  def purchase_reward(reward)
    if self.points >= reward.cost
      self.rewards << reward
      self.update(redeemed_points: (self.redeemed_points + reward.cost))
      self.update(points: (self.points - reward.cost))
    end
  end

  def unowned_rewards
    user_rewards = self.rewards.map{|reward| reward.id}
    all_rewards = Reward.all.pluck(:id)
    reward_set = all_rewards - user_rewards
    Reward.find(reward_set)
  end

end
