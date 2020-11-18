module CategoriesHelper
  def category_header(hash)
    text = hash[:category].persisted? ? "Редактирвоание категории" : "Создание новой категории"
    render inline: "<h1>#{text}</h1>"
  end
end
