class Movie < ActiveRecord::Base
	before_save :capitalize_title
  has_many :reviews, :dependent => :destroy
  has_many :moviegoers, :through => :reviews

  RATINGS = %w[G PG PG-13 R NC-17]  #  %w[] shortcut for array of strings
  @@grandfathered_date = Date.parse('1 Nov 1968')
  validates :title, :presence => true
  validates :release_date, :presence => true
  validate :released_1930_or_later # uses custom validator below
  validates :rating, :inclusion => {:in => RATINGS}, :unless => :grandfathered?
  
  # Not working - group_by issues
  scope :with_good_reviews, lambda { |threshold|
    Movie.joins(:reviews).group(:movie_id).
      having(['AVG(reviews.potatoes) > ?', threshold])
  }

  # workaround required 'rating in ?', %w(G PG)
  scope :for_kids, lambda {
    Movie.where("rating = ? OR rating = ?", 'G', 'PG')
  }

  # Not working - unknown column created_at issue
  scope :recently_reviewed, lambda { |n|
    Movie.joins(:reviews).where(['reviews.created_at >= ?', n.days.ago]).uniq
  }

  def released_1930_or_later
    errors.add(:release_date, 'must be 1930 or later') if
      self.release_date < Date.parse('1 Jan 1930')
  end
  
  def grandfathered? ; self.release_date >= @@grandfathered_date ; end
  
  def capitalize_title
    self.title = self.title.split(/\s+/).map(&:downcase).
      map(&:capitalize).join(' ')
  end
end