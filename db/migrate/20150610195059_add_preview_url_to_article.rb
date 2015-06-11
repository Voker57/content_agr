class AddPreviewUrlToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :preview_url, :string
  end
end
