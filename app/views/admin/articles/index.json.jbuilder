json.array!( @article ) do | article |
  json.extract! article, :id, :url, :title, :vk_link, :xpath, :belongs_to
  json.url article_url(article, format: :json)
end
