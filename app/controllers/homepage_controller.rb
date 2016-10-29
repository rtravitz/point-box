class HomepageController < ApplicationController

  def index
    @rewards = Reward.all[0..2]
  end

end
