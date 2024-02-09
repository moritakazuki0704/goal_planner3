class ScrapBooksController < ApplicationController

  def index
    @scrap_books = current_user.scrap_books.order("RANDOM()").page(params[:page])
    @scrap_book = ScrapBook.new
  end

  def create
    scrap_book = ScrapBook.new(scrap_book_params)
    scrap_book.user_id = current_user.id
    scrap_book.save
    redirect_to scrap_books_path
  end

  def show
    @scrap_book = ScrapBook.find(params[:id])
  end

  def destroy
    scrap_book =ScrapBook.find(params[:id])
    scrap_book.destroy
    redirect_to scrap_books_path
  end

  private

  def scrap_book_params
    params.require(:scrap_book).permit(:comment,:photo)
  end

end