class Article < ActiveRecord::Base
  require 'mechanize'
  require 'rss'
  require 'open-uri'
  require 'rest-client'
  has_many :category_articles
  has_many :categories, through: :category_articles
  belongs_to :article_source

  # ACCOUNT = ['danil3@i.ua', 'ytrhbx']

  YANDEX = ['https://news.yandex.ru/index.rss', 'https://news.yandex.ru/science.rss', 'https://news.yandex.ru/politics.rss',
          'https://news.yandex.ru/sport.rss', 'https://news.yandex.ru/finances.rss', 'https://news.yandex.ru/society.rss',
          'https://news.yandex.ru/world.rss']

  def self.parse_links
    # YansexSource.delete_all # Clear DB
    YANDEX.each do | yandex_rss |
      open( yandex_rss ) do | rss |
        feed = RSS::Parser.parse( rss )
        if yandex_rss == YANDEX[0]
          feed.items.each { | item | YandexSource.create category: 'news', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[1]
          feed.items.each { | item | YandexSource.create category: 'science', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[2]
          feed.items.each { | item | YandexSource.create category: 'politics', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[3]
          feed.items.each { | item | YandexSource.create category: 'sport', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[4]
          feed.items.each { | item | YandexSource.create category: 'buseness', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[5]
          feed.items.each { | item | YandexSource.create category: 'social', title: "#{ item.title }", url: "#{ item.link }" }
        elsif yandex_rss == YANDEX[6]
          feed.items.each { | item | YandexSource.create category: 'world', title: "#{ item.title }", url: "#{ item.link }" }
        end
      end
    end
  end
  L = 'https://news.yandex.ru/yandsearch?cl4url=ria.ru%2Fdefense_safety%2F20150709%2F1123493850.html'

  def self.agent_session
    agent = Mechanize.new
    get_links
  end

  def self.get_links
    # YandexSource.where( category: 'news' )
    # YandexSource.where( category: 'social' )
    # YandexSource.where( category: 'world' )
    # YandexSource.where( category: 'buseness' )
    # YandexSource.where( category: 'sport' )
    # YandexSource.where( category: 'politics' )
    # YandexSource.where( category: 'science' )
    links = L
    load_articles( links )
  end

  def self.load_articles( links )
    # links.each do | link |
    RestClient.get( links )
    # end
  end

  # def vk_login
  #   login_url = 'https://vk.com/'
  #   agent = agent_session
  #   page = agent.get( login_url )
  #   login_form = page.form_with( method: 'POST' )
  #   login_form.email = ACCOUNT[0]
  #   login_form.pass = ACCOUNT[1]
  #   page = login_form.submit
  # end
end
