class Category < ActiveRecord::Base

  has_many :category_articles
  has_many :articles, through: :category_articles

  scope :most_visited,   -> { where( title: 'most_visited' ).first }
  scope :most_readest,   -> { where( title: 'most_visited' ).first }
  scope :most_discussed, -> { where( title: 'most_discussed' ).first }
  scope :russia,         -> { where( title: 'russia' ).first }
  scope :main,           -> { where( title: 'main' ).first }

end
