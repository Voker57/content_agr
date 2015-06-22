require 'test_helper'
require 'open-uri'
require 'rss'
require 'rest-client'

class Article


  has_many :category_articles
  has_many :categories, through: :category_articles

  YANDEX_RSS = 'https://news.yandex.ru/hardware.rss'
  
  def reload_news 
    links = pull_links
  end

  def pull_links
    open( YANDEX_RSS ) do | rss |
      feed = RSS::Parser.parse(rss)
      links = feed.items.map { | item | item.link }
    end
  end


end

describe Article do
  before do
    @article = Article.new
  end

  describe 'what called method reload_news' do
    it 'must returned RSS array' do
      @article.reload_news.must_equal 'pull_links'
    end
  end
end

