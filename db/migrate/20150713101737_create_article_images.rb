class CreateArticleImages < ActiveRecord::Migration
  def change
    create_table :article_images do |t|
      t.integer :article_id
      t.string :image_url

      t.timestamps
    end
  end
end
