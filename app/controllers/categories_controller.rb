class CategoriesController < ApplicationController
  def show
    @top_read_articles = Category.most_visited.articles.limit( 2 )
    @category = Category.where( category_params ).first
    @articles = @category.articles
  end

  private
  def category_params
    params.permit( :title )
  end
end
