class RemoveUnnecessaryFieldsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :root
    remove_column :articles, :root_rating
    remove_column :articles, :news
    remove_column :articles, :news_rating
    remove_column :articles, :world
    remove_column :articles, :world_rating
    remove_column :articles, :russian
    remove_column :articles, :russian_rating
    remove_column :articles, :social
    remove_column :articles, :social_rating
    remove_column :articles, :political
    remove_column :articles, :political_rating
    remove_column :articles, :business
    remove_column :articles, :business_rating
    remove_column :articles, :science
    remove_column :articles, :science_rating
    remove_column :articles, :sport
    remove_column :articles, :sport_rating
    remove_column :articles, :hot
    remove_column :articles, :hot_rating
    remove_column :articles, :top_read
    remove_column :articles, :top_read_rating
    remove_column :articles, :top_video
    remove_column :articles, :top_video_rating
    remove_column :articles, :top_speak
    remove_column :articles, :top_speak_rating
    remove_column :articles, :interview
    remove_column :articles, :interview_rating
  end
end
