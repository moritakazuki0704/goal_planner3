class ScrapBooksController < ApplicationController

  before_action :not_design_your_ideal_life!

  def index
    @scrap_books = current_user.scrap_books.order("RANDOM()").page(params[:page])
    @scrap_book = ScrapBook.new
  end

  def create
    scrap_book = ScrapBook.new(scrap_book_params)
    scrap_book.user_id = current_user.id
    if scrap_book.save
      redirect_to scrap_books_path
    else
      redirect_to scrap_books_path(error: true)
    end
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

  # ログインユーザーがidealテーブルとmission_statementのカラムを作成していない場合のアクセス制限
  def not_design_your_ideal_life!
    if !current_user.ideal.present? && !current_user.mission_statement.present?
      redirect_to welcome_path
    end
  end

  def scrap_book_params
    params.require(:scrap_book).permit(:comment,:photo)
  end

end