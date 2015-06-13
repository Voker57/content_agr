class CategoriesController < ApplicationController
  def show
    @most_readest_articles = Category.most_readest.articles.limit( 2 )
    @category = Category.where( category_params ).first
    @articles = @category.articles
  end

  private
  def category_params
    params.permit( :title )
  end
end
