class Article < ActiveRecord::Base
  require 'mechanize'
  require 'open-uri'
  require 'rss'
  require 'rest-client'

  has_many :category_articles
  has_many :categories, through: :category_articles

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
    Rails.logger.info('=========================================================')
    Rails.logger.info( review_link )
    Rails.logger.info('=========================================================')
  end

end
