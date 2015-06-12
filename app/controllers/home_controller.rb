class HomeController < ApplicationController

  def index
    @hot_articles = Article.where( hot: true )
    @top_speak_articles = Article.where( top_speak: true )
    @russian_articles = Article.where( russian: true )
    @top_read_articles = Article.where( top_read: true )
  end

end
