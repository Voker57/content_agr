class HomeController < ApplicationController

  def index
    @category = Category.main
    @hot_articles = Category.most_visited.articles
    @most_discussed_articles = Category.most_discussed.articles
    @russian_articles = Category.russia.articles
    @most_readest_articles = Category.most_readest.articles.limit( 2 )
    @articles = @category.articles
  end

end
