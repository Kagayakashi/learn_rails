module RewardService
  class RewardIssue
    RULE_TYPE_FIRST_TRY = :completed_test_first_try.freeze
    RULE_TYPE_BY_LEVEL = :completed_all_tests_by_level.freeze
    RULE_TYPE_BY_CATEGORY = :completed_all_tests_by_category.freeze

    class << self
      def issue(test_passage)
        RewardIssue.first_try?(test_passage)
        RewardIssue.by_level?(test_passage)
        RewardIssue.by_category?(test_passage)
      end

      def first_try?(test_passage)
        return if TestPassage.where(user: test_passage.user, test: test_passage.test).count != 1

        reward = Reward.where(rule_type: RULE_TYPE_FIRST_TRY.to_s).first
        return if reward.nil?
        test_passage.user.issued_rewards.build(reward: reward).save
      end

      def by_level?(test_passage)
        test = test_passage.test
        completed_tests_by_level = Test
                                     .where(level: test.level)
                                     .joins(:test_passages)
                                     .where(test_passages: { user: test_passage.user })
                                     .uniq

        tests_by_level = Test.where(level: test.level)

        return if completed_tests_by_level.count != tests_by_level.count
        reward = Reward.where(rule_type: RULE_TYPE_BY_LEVEL.to_s).first
        return if reward.nil?
        test_passage.user.issued_rewards.build(reward: reward).save
      end

      def by_category?(test_passage)
        category = test_passage.test.category
        completed_tests_by_category = Test
                                        .joins(:category)
                                        .where(categories: { title: category.title })
                                        .joins(:test_passages)
                                        .where(test_passages: { user: test_passage.user })
                                        .uniq
        tests_by_category = Test
                              .joins(:category)
                              .where(categories: { title: category.title })

        return if completed_tests_by_category.count != tests_by_category.count
        reward = Reward.where(rule_type: RULE_TYPE_BY_CATEGORY.to_s).first
        return if reward.nil?
        test_passage.user.issued_rewards.build(reward: reward).save
      end
    end
  end
end