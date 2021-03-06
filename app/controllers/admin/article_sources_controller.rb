class Admin::ArticleSourcesController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: 'secret'
  
  before_action :set_article_source, only: [:show, :edit, :update, :destroy]
  before_action :get_header, only: [:new, :show, :index]
  
  # GET /article_sources
  # GET /article_sources.json
  def index
    @article_sources = ArticleSource.all
  end

  # GET /article_sources/1
  # GET /article_sources/1.json
  def show
  end

  # GET /article_sources/new
  def new
    
    
    @article_source = ArticleSource.new
  end

  # GET /article_sources/1/edit
  def edit
  end

  # POST /article_sources
  # POST /article_sources.json
  def create
    @article_source = ArticleSource.new( article_source_params )

    respond_to do | format |
      if @article_source.save
        format.html { redirect_to admin_article_source_path( @article_source ), notice: 'Article source was successfully created.' }
        format.json { render :show, status: :created, location: @article_source }
      else
        format.html { render :new }
        format.json { render json: @article_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_sources/1
  # PATCH/PUT /article_sources/1.json
  def update
    respond_to do | format |
      if @article_source.update( article_source_params )
        format.html { redirect_to @article_source, notice: 'Article source was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_source }
      else
        format.html { render :edit }
        format.json { render json: @article_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_sources/1
  # DELETE /article_sources/1.json
  def destroy
    @article_source.destroy
    respond_to do | format |
      format.html { redirect_to article_sources_url, notice: 'Article source was successfully destroyed.' }
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
    def set_article_source
      @article_source = ArticleSource.find( params[:id] )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_source_params
      params.require( :article_source ).permit( :url, :title, :vk_link, :xpath )
    end
end
