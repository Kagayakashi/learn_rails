class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
    @issued_rewards = current_user.rewards
  end
end
