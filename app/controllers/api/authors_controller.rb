class Api::AuthorsController < ApplicationController

  def index
    author = Author.all

    respond_to do |format|
      format.html
      format.json { render json: author }
    end
  end

  def show
    begin
      author = Author.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: author }
      end

    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end

  def create
    author = Author.new
    author.assign_attributes(author_params)
    if author.save
      respond_to do |format|
        format.html
        format.json { render json: author }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    begin
      author = Author.find(params[:id])
      author.assign_attributes(author_params)
      if author.save
        respond_to do |format|
          format.html
          format.json { render json: author }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: author.errors, status: :unprocessable_entity }
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
      author = Author.find(params[:id])
      author.destroy
      respond_to do |format|
        format.html
        format.json { render json: author }
      end
    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: "Author doesn't exist"}, status: :unprocessable_entity }
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
  
end

