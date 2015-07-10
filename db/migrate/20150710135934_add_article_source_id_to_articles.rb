class AddArticleSourceIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :article_source_id, :integer
  end
end
