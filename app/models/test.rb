class Test < ApplicationRecord
  belongs_to :сreator, :class_name => 'User'
  belongs_to :category
  
  has_many :users, through: :tests_users
  has_many :tests_users, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.tests_name_with_category_desc(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  end
end
