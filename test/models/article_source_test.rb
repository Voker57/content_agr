require "test_helper"

class ArticleSourceTest < ActiveSupport::TestCase
  def article_source
    @article_source ||= ArticleSource.new
  end

  def test_valid
    assert article_source.valid?
  end
end
