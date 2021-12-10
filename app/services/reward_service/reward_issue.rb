module RewardService
  class RewardIssue

    def initialize(test_passage)
      @user = test_passage.user
      @test = test_passage.test
    end

    def issue_rewards
      # Проверить все награды, можно ли их выдать
      Reward.find_each do |reward|
        issue_reward(reward) if send("#{reward.rule_type}?", reward.rule_key)
      end
    end

    private
    def first_try?(key)
      # Награда относится к текущему пройденому тесту?
      return false if @test.id != key
      @user.test_passages.where(test: @test).count == 1
    end

    def by_level?(key)
      completed_tests_by_level = @user.tests
                                      .where(level: key)
                                      .uniq
      tests_by_level = Test.where(level: key)

      return false if completed_tests_by_level.count.zero? or tests_by_level.count.zero?

      completed_tests_by_level.count == tests_by_level.count
    end

    def by_category?(key)
      completed_tests_by_category = @user.tests
                                         .joins(:category)
                                         .where(category: key)
                                         .uniq
      tests_by_category = Test.where(category: key)

      return false if completed_tests_by_category.count.zero? or tests_by_category.count.zero?

      completed_tests_by_category.count == tests_by_category.count
    end

    def issue_reward(reward)
      @user.issued_rewards.build(reward: reward).save
    end
  end
end