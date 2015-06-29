class Article < ActiveRecord::Base
  require 'mechanize'
  require 'rss'
  require 'open-uri'
  require 'rest-client'

  has_many :category_articles
  has_many :categories, through: :category_articles

  MY = ['!!!should be email!!!', '!!!should be password!!!']

  def self.vk_login
    login_url = 'https://vk.com/'
    agent = Mechanize.new
    page = agent.get( login_url )
    login_form = page.form_with( method: 'POST' )
    login_form.email = MY[0]
    login_form.pass = MY[1]
    page = login_form.submit
  end

  def self.get_links
    links = VkGroup.with_links.pluck( :link )
    review = reload_news( links )
  end

  def self.reload_news( links )
    review_link = []
    agent = Mechanize.new
    links.each do | link |
      page = agent.get( link )
      review_link << page.links_with( href: %r{^/away.php?} )
    end
  end

end
