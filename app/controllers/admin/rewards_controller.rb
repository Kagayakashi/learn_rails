class Admin::RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_reward, only: %i[edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found

  def index
    @rewards = Reward.all
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.build(reward_params)
    if @reward.save
      redirect_to admin_rewards_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @reward.destroy
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :image_url, :rule_type, :rule_value)
  end

  def find_reward
    @reward = Reward.find(params[:id])
  end

  def rescue_not_found
    render plain: 'Награда не найдена!'
  end
end
