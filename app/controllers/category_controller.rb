class CategoryController < ApplicationController
  def world
    @world_articles = Article.where( world: true )
  end

  def russian
    @russian_articles = Article.where( russian: true )
  end

  def social
    @social_articles = Article.where( social: true )
  end

  def political
    @political_articles = Article.where( political: true )
  end

  def business
    @business_articles = Article.where( business: true )
  end

  def science
    @science_articles = Article.where( science: true )
  end

  def sport
    @sport_articles = Article.where( sport: true )
  end
end
