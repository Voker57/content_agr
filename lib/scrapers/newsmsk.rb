module Scrapers::Newsmsk
	def self.get_article_links
		links = []
		site_url = "http://www.newsmsk.com/all"
		www = ScrapeUtils.new_mechanize
		newslist = www.get site_url
		newslist.search("td[@class='new_rubric_list']//div[@class='padding']").each do |par|
			next unless par["style"].nil?
# 			puts par
			links << URI.parse(site_url).merge(par.at("a")["href"]).to_s
		end
		links
	end
	
	def self.get_article(link)
		www = ScrapeUtils.new_mechanize
		article_page = www.get link
		content = article_page.at("div[@class='_ga1_on_']").inner_html.encode("utf-8")
		images = article_page.search("div[@class='article_text']//div[@class='image_link_holder']").map {|div| div["onclick"].scan(/open\('(.*?)'\)/)[0][0]}
		return({title: article_page.at("div[@class='news_head_inner']").inner_text.strip, text: content, images: images})
	end
end