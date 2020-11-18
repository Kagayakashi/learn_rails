module CategoriesHelper
  def category_header(category:)
    if category.persisted?
      text = "Редактирвоание категории"
    else
      text = "Создание новой категории"
    end

    content_tag :h1, text
  end
end
