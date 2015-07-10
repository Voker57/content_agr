class AddCategoryToYandexSource < ActiveRecord::Migration
  def change
    add_column :yandex_sources, :category, :string
  end
end
