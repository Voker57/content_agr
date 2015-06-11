class AddCategoriesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :root,             :boolean
    add_column :articles, :root_rating,      :integer
    add_column :articles, :news,             :boolean
    add_column :articles, :news_rating,      :integer
    add_column :articles, :world,            :boolean
    add_column :articles, :world_rating,     :integer
    add_column :articles, :russian,          :boolean
    add_column :articles, :russian_rating,   :integer
    add_column :articles, :social,           :boolean
    add_column :articles, :social_rating,    :integer
    add_column :articles, :political,        :boolean
    add_column :articles, :political_rating, :integer
    add_column :articles, :business,         :boolean
    add_column :articles, :business_rating,  :integer
    add_column :articles, :science,          :boolean
    add_column :articles, :science_rating,   :integer
    add_column :articles, :sport,            :boolean
    add_column :articles, :sport_rating,     :integer
    add_column :articles, :hot,              :boolean
    add_column :articles, :hot_rating,       :integer
    add_column :articles, :top_read,         :boolean
    add_column :articles, :top_read_rating,  :integer
    add_column :articles, :top_video,        :boolean
    add_column :articles, :top_video_rating, :integer
    add_column :articles, :top_speak,        :boolean
    add_column :articles, :top_speak_rating, :integer
    add_column :articles, :interview,        :boolean
    add_column :articles, :interview_rating, :integer
  end
end
