module Scrapers::MoskvaBezformata
	def self.get_article_links
		links = []
		site_url = "http://moskva.bezformata.ru"
		www = ScrapeUtils.new_mechanize
		mainpage = www.get site_url
		mainpage.search("div[@class='hottopic_box']/div[1]/div").each do |div|
			links << div.at("a")["href"]
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		content = if article_page.at("index/p")
			article_page.search("index/p").to_s
		else
			s = ""
			article_page.at("index").children.each {|c| if c.name != "div" && !c.comment? then s << c.to_s end}
			s
		end
		images = []
		if article_page.at("div[@class='topicimage_box']")
			images << article_page.at("div[@class='topicimage_box']/a")["href"]
		end
		return({title: article_page.at("h1").inner_text.strip, text: content, images: images})
	end
end