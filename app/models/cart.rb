class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy

  def add_book(book, quantity)
    li = LineItem.where(book_id: book.id)
    if li.any?
      #проверили на пустоту массив
      li = li.take
      #взяли из массива обьект
      li.quantity += quantity
      #присвоили количество обьекту
      return li
      #вернули значение не сохранив его
    else
      self.line_items.build(book: book, quantity: quantity)
    end
  end
end
