class Country < ActiveRecord::Base
  has_many :addresses

  validates :price, presence: true, uniqueness: true
end
