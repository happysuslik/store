class Rating < ActiveRecord::Base
  belongs_to :user, :inverse_of => :ratings
  belongs_to :book, :inverse_of => :ratings

  validates_inclusion_of :rating, in: 1..5

  validates_presence_of :review

end
