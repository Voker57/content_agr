class CategoriesController < ApplicationController
  def show
    @header_categories = Category.header
    @current = Russian::strftime( Time.now, "%A, %m.%d.%y, %R" )
    @most_readest_articles = Category.most_readest.first.articles.limit( 4 )
    @category = Category.where( title: params[ :title ] ).first
    @articles = @category.articles
  end

  private
  def category_params
    params.permit( :title )
  end
end
