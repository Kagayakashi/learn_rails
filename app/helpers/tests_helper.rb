module TestsHelper
  TEST_LEVELS = {
    0 => I18n.t('helpers.custom.label.test.level_easy'),
    1 => I18n.t('helpers.custom.label.test.level_easy'),
    2 => I18n.t('helpers.custom.label.test.level_normal'),
    4 => I18n.t('helpers.custom.label.test.level_normal'),
  }.freeze

  def test_level(test)
    TEST_LEVELS[test.level] || I18n.t('helpers.custom.label.test.level_hard')
  end
  
  def test_header(test:)
    text = if test.persisted?
        I18n.t('helpers.custom.header.test.editing')
      else
        I18n.t('helpers.custom.header.test.creating')
      end
    content_tag :h1, text
  end
end
