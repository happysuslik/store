class RatingsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @book.ratings.create(review: params[:review], rating: params[:rating])
    redirect_to book_path(@book)
  end
end
