module RewardService
  class RewardIssue

    def initialize(test_passage)
      @user = test_passage.user
      @test = test_passage.test
    end

    def issue_rewards
      Reward.all.each do |reward|
        issue_reward(reward) if send("#{reward.rule_type}?")
      end
    end

    private
    def completed_test_first_try?
      TestPassage.where(user: @user, test: @test).count == 1
    end

    def completed_all_tests_by_level?
      completed_tests_by_level = @user.tests.where(:level => @test.level).uniq
      tests_by_level = Test.where(level: @test.level)
      completed_tests_by_level.count == tests_by_level.count
    end

    def completed_all_tests_by_category?
      completed_tests_by_category = Test
                                      .joins(:category)
                                      .where(categories: { title: @test.category.title })
                                      .joins(:test_passages)
                                      .where(test_passages: { user: @user })
                                      .uniq
      tests_by_category = Test
                            .joins(:category)
                            .where(categories: { title: @test.category.title })

      completed_tests_by_category.count == tests_by_category.count
    end

    def issue_reward(reward)
      @user.issued_rewards.build(reward: reward).save
    end
  end
end