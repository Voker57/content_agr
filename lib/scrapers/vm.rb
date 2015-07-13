module Scrapers::Vm
	def self.get_article_links
		links = []
		site_url = "http://vm.ru/news"
		www = ScrapeUtils.new_mechanize
		newslist = www.get "http://vm.ru/news"
		newslist.search("div[@id='newslist']//ul[@class='articles-list']/li").each do |li|
			links << URI.parse("http://vm.ru/").merge(li.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		images = article_page.search("a[@class='gallery-image-link']").map {|a| a["href"]}
		return({title: article_page.at("article[@class='article 111']//h1").inner_text.strip, text: article_page.at("article[@class='article 111']//div[@class='content clearfix']").inner_html, images: images})
	end
end