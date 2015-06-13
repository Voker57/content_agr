class CreateCategoryArticles < ActiveRecord::Migration
  def change
    create_table :category_articles do |t|

      t.integer :category_id
      t.integer :article_id
      t.integer :rating, default: 10

      t.timestamps
    end
  end
end
