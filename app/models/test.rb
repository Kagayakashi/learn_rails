class Test < ApplicationRecord
  def self.tests_name_with_category_desc(category)
    joins("join categories on tests.category_id = categories.id")
      .where(categories: { title: category })
      .order(title: :desc)
  end
end
