class CategoryController < ApplicationController
  def world
  end

  def russian
  end

  def social
  end

  def political
  end

  def business
  end

  def science
    @science_articles = Article.where( science: true )
  end

  def sport
  end
end
