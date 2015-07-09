class Article < ActiveRecord::Base
  require 'mechanize'
  require 'rss'
  require 'open-uri'
  require 'rest-client'
  require 'content_engine'
  has_many :category_articles
  has_many :categories, through: :category_articles
  belongs_to :article_source

  ACCOUNT = ['danil3@i.ua', 'ytrhbx']


  def self.agent_session
    agent = Mechanize.new
    get_links
  end

  def self.get_links
    links = ArticleSource.urls.pluck( :url )
    load_articles( links )
  end

  def self.load_articles( links )
    review_link = []
    agent = agent_session
    links.each do | link |
      page = agent.get( link )
      review_link << page.links_with( href: %r{^/away.php?} )
    end
  end

  def vk_login
    login_url = 'https://vk.com/'
    agent = agent_session
    page = agent.get( login_url )
    login_form = page.form_with( method: 'POST' )
    login_form.email = ACCOUNT[0]
    login_form.pass = ACCOUNT[1]
    page = login_form.submit
  end

end
