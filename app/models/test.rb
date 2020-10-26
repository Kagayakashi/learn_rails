class Test < ApplicationRecord
  
  # Содержит в себе сущности:
  has_many :questions
  has_one :сreator, :class_name => 'User'
  
  # Содержится сам как сущность в:
  belongs_to :category
  # belongs_to :testing
  
  # Содержит и содержится сам как сущность в:
  # has_and_belongs_to_many :users
  # Альтернатива has_and_belongs_to_many
  has_many :tests_users
  has_many :users, through: :tests_users
  
  # Записать в таблицу TESTS_USERS для теста @test пользователя @user
  # test.users.push(user)

  def self.tests_name_with_category_desc(category)
    joins("join categories on tests.category_id = categories.id")
      .where(categories: { title: category })
      .order(title: :desc)
  end
end
