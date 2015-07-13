module Scrapers::Mailru
	def self.get_article_links
		links = []
		site_url = "https://news.mail.ru/"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search("div[@class='c-notified js-topnews']/section/div/div").each do |par|
			links << URI.parse(site_url).merge(par.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		content = article_page.search("div[@class='js-newstext s-text']/index/p").to_s
		images = article_page.search("a[@class='s-fotostripe__item__link js-preview-list__item']").map {|a| URI.parse(link).merge(a["data-original"].gsub(/\|.*$/, "")).to_s}
		return({title: article_page.at("h1/index").inner_text.strip, text: content, images: images})
	end
end