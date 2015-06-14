class HomeController < ApplicationController

  def index
    @header_categories = Category.header
    @current = Russian::strftime( Time.now, "%A, %m.%d.%y, %R" )

    @category = Category.main.first
    @hot_articles = Category.most_visited.first.articles
    @most_discussed_articles = Category.most_discussed.first.articles
    @russian_articles = Category.russia.first.articles
    @most_readest_articles = Category.most_readest.first.articles.limit( 2 )
    @articles = @category.articles
  end

end
