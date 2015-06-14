class Category < ActiveRecord::Base

  has_many :category_articles
  has_many :articles, through: :category_articles

  scope :most_visited,   -> { where( title: 'most_visited' ) }
  scope :most_readest,   -> { where( title: 'most_visited' ) }
  scope :most_discussed, -> { where( title: 'most_discussed' ) }
  scope :russia,         -> { where( title: 'russia' ) }
  scope :main,           -> { where( title: 'main' ) }

  def self.header
    where( title: %w( main news world russia social political business science sport ) )
  end

end
