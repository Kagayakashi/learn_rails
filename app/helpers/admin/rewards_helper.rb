module Admin::RewardsHelper
  def reward_header(reward:)
    text =
      if reward.persisted?
        I18n.t('helpers.custom.header.reward.editing')
      else
        I18n.t('helpers.custom.header.reward.creating')
      end
    content_tag :h1, text
  end

  def rules_to_select
    Reward::RULES.collect { |r| [r[:name], r[:value]] }
  end
end
