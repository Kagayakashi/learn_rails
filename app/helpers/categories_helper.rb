module CategoriesHelper
  def category_header(category:)
    text =
      if category.persisted?
        I18n.t('helpers.custom.header.category.editing')
      else
        I18n.t('helpers.custom.header.category.creating')
      end
    content_tag :h1, text
  end
end
