class Article < ActiveRecord::Base
  require 'mechanize'
  require 'rss'
  require 'open-uri'
  require 'rest-client'

  has_many :category_articles
  has_many :categories, through: :category_articles
  belongs_to :article_source

  MY = ['email', 'password']

  def self.agent_session
    agent = Mechanize.new
  end

  def self.get_links
    links = VkGroup.with_links.pluck( :link )
    review = reload_news( links )
  end

  def self.reload_news( links )
    review_link = []
    agent = agent_session
    links.each do | link |
      page = agent.get( link )
      review_link << page.links_with( href: %r{^/away.php?} )
    end
  end

end
