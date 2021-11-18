class IssuedRewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @issued_rewards = current_user.rewards
  end
end
