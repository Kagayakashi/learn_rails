class Reward < ApplicationRecord
  RULES = [
    { :name => I18n.t('first_try'), :value => 'completed_test_first_try' },
    { :name => I18n.t('by_level'), :value => 'completed_all_tests_by_level' },
    { :name => I18n.t('by_category'), :value => 'completed_all_tests_by_category' },
  ].freeze

  has_many :issued_rewards, dependent: :destroy
  has_many :users, through: :issued_rewards

  validates :name, presence: true
  validates :image_url, presence: true
  validates :rule_type, presence: true
end
