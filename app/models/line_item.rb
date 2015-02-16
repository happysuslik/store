class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  belongs_to :order
  validates :quantity, presence: true

  def calc_price
    self.price = quantity* book.price
    save
  end

end
