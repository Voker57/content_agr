module Scrapers::Tass
	def self.get_article_links
		links = []
		site_url = "http://tass.ru/"
		www = ScrapeUtils.new_mechanize
		newslist = JSON.parse(www.get("http://tass.ru/api/news/lenta?limit=50&sections%5B%5D=23&sections%5B%5D=22&sections%5B%5D=4730&sections%5B%5D=25&sections%5B%5D=24&sections%5B%5D=27&sections%5B%5D=2176&sections%5B%5D=28&sections%5B%5D=4630&sections%5B%5D=4614").body)
		newslist["articles"].map{|a| a["url"]}
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		images = article_page.search("a[@class='b-gallery-widget-item__pic']/img").map {|i| i["src"]}
		return({title: article_page.at("h1[@class='b-material__title']").inner_text.strip, text: article_page.search("div[@class='b-material-text__l']/p").to_s, images: images})
	end
end