class BooksController < ApplicationController
  def index
	@books = Book.order('id ASC')
  end

  def show
	@book = Book.find(params[:id])
  end

  def new
	@book = Book.new
	
  end
  
  def create
	@book = Book.new(subject_params)
	if @book.save
		redirect_to(books_index_path)
		flash[:notice] =  "The book #{@book.title} was added successfully"
	else
		render('new')
	end
  end

  def edit
	@book = Book.find(params[:id])
  end
  
  def update
	@book = Book.find(params[:id])
	if @book.update(subject_params)
		redirect_to(books_index_path)
		flash[:notice] =  "The book #{@book.title} was updated successfully"
	else
		render('edit')
	end
  end

  def delete
	@book = Book.find(params[:id])
  end
  
  def destroy
	@book = Book.find(params[:id])
	@book.destroy
	redirect_to(books_index_path)
	flash[:notice] =  "The book #{@book.title} was deleted successfully"
  end
  
  private
	
	def subject_params
			params.require(:book).permit(:title, :author, :genre, :price, :publishDate)
	end
end
