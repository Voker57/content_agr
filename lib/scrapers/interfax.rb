module Scrapers::Interfax
	def self.get_article_links
		links = []
		site_url = "http://www.interfax.ru/"
		www = ScrapeUtils.new_mechanize
		mainpage = www.get site_url
		mainpage.encoding = 'windows-1251'
		mainpage.search("div[@class='dNewsOne']/div").each do |div|
			next unless div["class"] =~ /text/
			links << URI.parse("http://www.interfax.ru").merge(div.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		article_page.encoding = 'windows-1251'
		images = []
		if article_page.at("div[@class='wrap']//img[@itemprop='contentUrl']")
			images << URI.parse("http://www.interfax.ru").merge(article_page.at("div[@class='wrap']//img[@itemprop='contentUrl']")["src"]).to_s
		end
		return({title: article_page.at("h1[@class='textMTitle']").inner_text.strip, text: article_page.search("div[@itemprop='articleBody']/p").to_s.encode("utf-8"), images: images})
	end
end