module Scrapers
module Kp
	def self.get_article_links
		links = []
		site_url = "http://www.kp.ru"
		www = ScrapeUtils.new_mechanize
		mainpage = www.get site_url
		mainpage.search("ul[@id='content_news24']/li").each do |li|
			links << li.at("a")["href"]
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		h1 = ""
		article_page.at("h1").children.each {|c| if c.text? then h1 << c.to_s end}
		images = []
		images << article_page.at("div[@class='a_main-photo media img']//img")["src"] if article_page.at("div[@class='a_main-photo media img']//img")
		return({title: h1.strip, text: article_page.at("div[@id='hypercontext']").inner_html, images: images})
	end
end
end