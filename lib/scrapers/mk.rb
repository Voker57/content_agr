module Scrapers::Mk
	def self.get_article_links
		links = []
		site_url = "http://www.mk.ru/news/"
		www = ScrapeUtils.new_mechanize
		mainpage = www.get site_url
		mainpage.search("ul[@class='news_list news_list_big']/li").each do |li|
			links << li.at("a")["href"]
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		return({title: article_page.at("h1").inner_text.strip, text: article_page.search("div[@class='content']/p").to_s})
	end
end