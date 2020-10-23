class User < ApplicationRecord
  def tests_with_level(level)
    Test
      .joins("join testings on testings.test_id = tests.id")
      .where(testings: {user_id: self.id}, tests: {level: level})
  end
  
end
