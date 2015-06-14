class CategoriesController < ApplicationController
  def show
    @most_readest_articles = Category.most_readest.first.articles.limit( 4 )
    @category = Category.where( category_params ).first
    @articles = @category.articles
  end

  private
  def category_params
    params.permit( :title )
  end
end
