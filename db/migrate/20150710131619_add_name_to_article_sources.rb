class AddNameToArticleSources < ActiveRecord::Migration
  def change
    add_column :article_sources, :name, :string
  end
end
