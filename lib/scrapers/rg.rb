module Scrapers::Rg
	def self.get_article_links
		links = []
		site_url = "http://www.rg.ru/news.html"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		(newslist.search("div[@class='content4-1l']/div[@class='zg']") + newslist.search("div[@class='content4-2l']/div[@class='zg']") + newslist.search("div[@class='content4-3l']/div[@class='zg']") + newslist.search("div[@class='content4-4l']/div[@class='zg']")).each do |par|
			links << URI.parse(site_url).merge(par.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		images = [article_page.at("img[@id='article_big_img']")["src"]] if article_page.at("img[@id='article_big_img']")
		if article_page.at("div[@class='s-large-title']")
			content = article_page.search("div[@class='s-large-announce-text']/p").to_s
			return({title: article_page.at("div[@class='s-large-title']").inner_text.strip, text: content, images: images})
		elsif article_page.at("div[@class='content-box-item__info__head__title']")
			return({title: article_page.at("div[@class='content-box-item__info__head__title']").inner_text.strip, text: article_page.search("div[@class='content-box-item__info__uannounce']/p").to_s, images: images})
		else
			content = article_page.search("div[@class='main-text']/p").to_s
			return({title: article_page.at("h1").inner_text.strip, text: content, images: images})
		end
	end
end