class AddMainCategoryTitleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :main_category_title, :string, default: 'world'
  end
end
