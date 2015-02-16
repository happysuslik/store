class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :author
  has_many :ratings
  has_many :line_items
  mount_uploader :image, ImageUploader

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :stock, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :stock,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар

  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end

end
