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

  end
end
