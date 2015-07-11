module Scrapers::Rosbalt
	def self.get_article_links
		links = []
		site_url = "http://www.rosbalt.ru/main/allnews/"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search("div[@id='content']//td/p").each do |par|
			next unless par["style"] =~ /font-size:14px; padding: 10px 0 0 0;/
			links << URI.parse(site_url).merge(par.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		content = ""
		article_page.at("div[@id='mat_cont']//article").children.each {|c| if c.name != "h1" then content << c.to_s end}
		return({title: article_page.at("div[@id='mat_cont']//h1").inner_text.strip, text: content.gsub(/<script.*?<\/script>/m,"")})
	end
end