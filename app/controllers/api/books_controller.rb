class Api::BooksController < ApplicationController

  def index
    books = Book.all

    render json: books
  end

  def create
    book = Book.new
    book.assign_attributes(book_params)
    if book.save
      respond_to do |format|
        format.html
        format.json { render json: book }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: book.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    begin
      book = Book.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: book }
      end

    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end

  def update
    begin
      book = Book.find(params[:id])
      book.assign_attributes(book_params)
      if book.save
        respond_to do |format|
          format.html
          format.json { render json: book }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: book.errors, status: :unprocessable_entity }
        end
      end
    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      book = Book.find(params[:id])
      book.destroy
      respond_to do |format|
        format.html
        format.json { render json: book }
      end
    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: "Book doesn't exist"}, status: :unprocessable_entity }
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :price, :stock)
  end
end

