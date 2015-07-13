module ContentEngine
  class << self

    def work
      parse_articles
      parse_vk
      sort_articles
      publish_articles
    end

    def parse_articles
    end

    def parse_vk
    end

    def sort_articles
    end

    def publish_articles
    end
    
    def get_all_articles
    	scraper_names = %w|kp moskva_bezformata mk interfax tass vm rosbalt mailru newsmsk rg|
    	scraper_names.each do |n| get_articles n end
    end
    
		def get_articles(scraper_name)
			scraper = Scrapers.const_get(scraper_name.camelize)
			article_source = ArticleSource.where(name: scraper_name).first || ArticleSource.new(name: scraper_name)
			article_source.save! if article_source.new_record?
			article_links = scraper.get_article_links
			article_links.each do |link|
				next if article_source.articles.where(source_url: link).first
				article_data = scraper.get_article(link)
				article = article_source.articles.build(article_title: article_data[:title], article_body: article_data[:text], source_url: link)
				(article_data[:images] || []).each do |image_link|
					image = article.article_images.build(image_url: image_link)
				end
				article.save!
			end
		end

  end
end
