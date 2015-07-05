class Admin::ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :get_header, only: [:new, :show, :index]
  
  def index
    @articles = Article.all
  end

  def show
  end
  
  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new( article_params )

    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_path( @article ) }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update( article_params )
        format.html { redirect_to @article, notice: 'Article source was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to article_url, notice: 'Article source was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_header
    @header_categories = Category.header
    @current = Russian::strftime( Time.now, "%A, %d.%m.%y, %R" )
    
    @category = Category.main.first
    @hot_articles = Category.most_visited.first.articles
    @most_discussed_articles = Category.most_discussed.first.articles
    @russian_articles = Category.russia.first.articles
    @most_readest_articles = Category.most_readest.first.articles.limit( 2 )
    @articles = @category.articles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find( params[:id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require( :article ).permit( :url_title, :page_title, :article_title, :article_body, :source_url, :preview_url )
    end

end
