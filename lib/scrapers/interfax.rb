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
		return({title: article_page.at("h1[@class='textMTitle']").inner_text.strip, text: article_page.search("div[@itemprop='articleBody']/p").to_s.encode("utf-8")})
	end
end