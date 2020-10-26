class User < ApplicationRecord

  # Содержится сам как сущность в:
  belongs_to :test # Как создатель теста
  
  #has_and_belongs_to_many :tests
  # Альтернатива has_and_belongs_to_many
  has_many :tests_users
  has_many :tests, through: :tests_users # При вызове тестов, подключение промежуточной модели для получения объектов тестов
  
  # Найти в таблице TESTS_USERS пользователя @user с тестом @test
  # users.tests
  
  def tests_with_level(level)
    Test
      .joins("join testings on testings.test_id = tests.id")
      .where(testings: {user_id: self.id}, tests: {level: level})
  end
  
end
