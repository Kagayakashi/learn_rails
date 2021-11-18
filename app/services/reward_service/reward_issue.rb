module RewardService
  class RewardIssue
    RULE_TYPE_FIRST_TRY = :completed_test_first_try.freeze
    RULE_TYPE_BY_LEVEL = :completed_all_tests_by_level.freeze
    RULE_TYPE_BY_CATEGORY = :completed_all_tests_by_category.freeze

    class << self
      def issue(test_passage)
        @@test_passage = test_passage

        RewardIssue.first_try?
      end

      def first_try?
        return if TestPassage.where(user: @@test_passage.user, test: @@test_passage.test).count != 1
        reward = Reward.where(rule_type: RULE_TYPE_FIRST_TRY.to_s).first
        return if reward.nil?
        @@test_passage.user.issued_rewards.build(reward: reward).save
      end

      def by_level?(reward)
        # TODO
      end

      def by_category?(reward)
        # TODO
      end
    end
  end
end