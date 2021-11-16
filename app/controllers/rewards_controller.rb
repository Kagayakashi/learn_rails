class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = Reward.all
  end
end
