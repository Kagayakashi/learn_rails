class Reward < ApplicationRecord
  RULES = [
    {
      :name => 'Выполнение теста с первой попытки',
      :value => 'completed_test_first_try',
    },
    {
      :name => 'Выполнение всех тестов определенного уровня',
      :value => 'completed_all_tests_by_level',
    },
    {
      :name => 'Выполнение всех тестов определенной категории',
      :value => 'completed_all_tests_by_category',
    },
  ].freeze

  has_many :issued_rewards, dependent: :destroy
  has_many :users, through: :issued_rewards

  validates :name, presence: true
  validates :image_url, presence: true
  validates :rule_type, presence: true, inclusion: { in: RULES }
  validates :rule_value, presence: true, uniqueness: { scope: %i[rule_type] }
end
