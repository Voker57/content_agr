class Article < ActiveRecord::Base

  has_many :category_articles
  has_many :categories, through: :category_articles

end
