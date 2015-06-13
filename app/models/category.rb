class Category < ActiveRecord::Base

  has_many :category_articles
  has_many :articles, through: :category_articles

  scope :most_visited, -> { where( title: 'most_visited' ).first }

end
