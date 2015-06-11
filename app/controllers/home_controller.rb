class HomeController < ApplicationController

  def index
    @hot_articles = Article.where( hot: true )
  end

end
