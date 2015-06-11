class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :url_title
      t.string :page_title
      t.string :article_title
      t.text   :article_body
      t.string :source_url

      t.timestamps
    end
  end
end
