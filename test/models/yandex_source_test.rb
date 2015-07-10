require "test_helper"

class YandexSourceTest < ActiveSupport::TestCase
  def yandex_source
    @yandex_source ||= YandexSource.new
  end

  def test_valid
    assert yandex_source.valid?
  end
end
