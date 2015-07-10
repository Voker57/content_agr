class CreateYandexSources < ActiveRecord::Migration
  def change
    create_table :yandex_sources do |t|
      t.string :title
      t.string :url

    end
  end
end
