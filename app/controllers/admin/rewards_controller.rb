class Admin::RewardsController < Admin::BaseController
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
    @reward = Reward.create(reward_params_except_rule_keys)
    set_rule_key_attr
    if @reward.save
      redirect_to admin_rewards_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    set_rule_key_attr
    if @reward.update(reward_params_filtered)
      redirect_to admin_rewards_path
    else
      render 'edit'
    end
  end

  def destroy
    @reward.destroy
    redirect_to admin_rewards_path
  end

  private

  def reward_params
    params.require(:reward)
  end

  def reward_params_filtered
    reward_params.permit(:name, :image_url, :rule_type)
  end

  def set_rule_key_attr
    key = reward_params[reward_params[:rule_type]]
    @reward.attributes = {:rule_key => key}
  end

  def find_reward
    @reward = Reward.find(params[:id])
  end

  def rescue_not_found
    render plain: 'Награда не найдена!'
  end
end
