class ArticlesController < ApplicationController
  def show
    @article = Article.find_by( params[ :title ] )
    @header_categories = Category.header
    @category = Category.where( title: params[ :category_title ] ).first
    @most_readest_articles = Category.most_readest.first.articles.limit( 4 )

  end
end
