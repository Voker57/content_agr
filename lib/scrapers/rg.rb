module Scrapers::Rg
	def self.get_article_links
		links = []
		site_url = "http://www.rg.ru/news.html"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search("div[@class='zg']").each do |par|
			links << URI.parse(site_url).merge(par.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		if article_page.at("div[@class='s-large-title']")
			content = article_page.search("div[@class='s-large-announce-text']/p").to_s
			return({title: article_page.at("div[@class='s-large-title']").inner_text.strip, text: content})
		else
			content = article_page.search("div[@class='main-text']/p").to_s
			return({title: article_page.at("h1").inner_text.strip, text: content})
		end
	end
end