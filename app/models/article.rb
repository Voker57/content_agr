class Article < ActiveRecord::Base
  require 'mechanize'
  require 'date'
  require 'json'
  require 'open-uri'
  require 'rss'
  require 'rest-client'

  has_many :category_articles
  has_many :categories, through: :category_articles


  def self.reload_news
    page = pull_links
  end

  def self.pull_links
    SOURCES.each do | sources |
      agent = Mechanize.new
      page = agent.get( sources )
      #review_links = review_links[1...6]
    end
  end










=begin
  #YANDEX_RSS = ['https://news.yandex.ru/world.rss', 'https://news.yandex.ru/index.rss', 'https://news.yandex.ru/politics.rss']
  YANDEX_RSS = 'https://news.yandex.ru/index.rss'

  def self.reload_news
    links = pull_links
  end

  def self.pull_links
   # YANDEX_RSS.each do | yandex_rss |
      open( YANDEX_RSS ) do | rss |
        feed = RSS::Parser.parse( rss )
        links = feed.items.map { | item | item.link }
        sources = links.map { | link | CGI.parse( link ) }
        links = sources.map { | elem | elem.values }.join(' ').split()
      end
    #end
=end
end
