class Reward < ApplicationRecord
  enum rules: [:first_try, :by_level, :by_category]

  has_many :issued_rewards, dependent: :destroy
  has_many :users, through: :issued_rewards

  validates :name, presence: true
  validates :image_url, presence: true
  validates :rule_type, presence: true
end
