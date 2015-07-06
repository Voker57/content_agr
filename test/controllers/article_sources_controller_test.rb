require "test_helper"

class ArticleSourcesControllerTest < ActionController::TestCase
  def article_source
    @article_source ||= article_sources :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:article_sources)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("ArticleSource.count") do
      post :create, article_source: { belongs_to: article_source.belongs_to, title: article_source.title, url: article_source.url, vk_link: article_source.vk_link, xpath: article_source.xpath }
    end

    assert_redirected_to article_source_path(assigns(:article_source))
  end

  def test_show
    get :show, id: article_source
    assert_response :success
  end

  def test_edit
    get :edit, id: article_source
    assert_response :success
  end

  def test_update
    put :update, id: article_source, article_source: { belongs_to: article_source.belongs_to, title: article_source.title, url: article_source.url, vk_link: article_source.vk_link, xpath: article_source.xpath }
    assert_redirected_to article_source_path(assigns(:article_source))
  end

  def test_destroy
    assert_difference("ArticleSource.count", -1) do
      delete :destroy, id: article_source
    end

    assert_redirected_to article_sources_path
  end
end
