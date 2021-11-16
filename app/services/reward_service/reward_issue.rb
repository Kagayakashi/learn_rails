module RewardService
  class RewardIssue
    RULE_TYPE_FIRST_TRY = :completed_test_first_try.freeze
    RULE_TYPE_BY_LEVEL = :completed_all_tests_by_level.freeze
    RULE_TYPE_BY_CATEGORY = :completed_all_tests_by_category.freeze

    class << self
      def issue(user:, test:)
        user = user
        test = test

=begin
      Reward.all.each do |reward|
        first_try? reward
        by_level? reward
        by_category? reward
        end
=end
        RewardIssue.first_try? user: user, test: test
      end

      def first_try?(user:, test:)
        # TODO Доделать поиск награды.
        reward = Reward.where(rule_type: RULE_TYPE_FIRST_TRY.to_s, rule_value: test.title)
        return if reward.nil?
        IssuedReward.create(user: user, reward: reward) if TestPassage.where(user: user, test: test).count.nonzero?
      end

      def by_level?(reward)
        false
      end

      def by_category?(reward)
        false
      end
    end
  end
end