class Article < ActiveRecord::Base
  require 'mechanize'
  require 'open-uri'
  require 'rss'
  require 'rest-client'

  has_many :category_articles
  has_many :categories, through: :category_articles

  def self.get_links
    links = VkGroup.with_links.pluck( :link_group )
    review = reload_news( links )
  end

  def self.reload_news( links )
    review = []
    agent = Mechanize.new
    links.each do | link |
      page = agent.get( link )
      review << page.links_with( href: %r{^/away.php?\w+} )
      #review_link = review_link[2...6] #первый два линка не берем, потому что там ссылки не на статьи, а на сайты новостей
    end
  end

end
