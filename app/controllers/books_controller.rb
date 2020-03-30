class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @bookn = Book.new
  end

  def new
  	@book = Book.new
  end

  def edit
     @book = Book.find(params[:id])
     if current_user !=  @book.user
      redirect_to books_path
     end
  end

  def create
    @book = Book.new(list_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id) ,notice: "You have creatad book successfully."
    else
      @users = User.all
      @books = Book.all
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(list_params)
    redirect_to book_path(book.id),notice: " successfully update."
    else
      @book = Book.find(params[:id])
      flash[:notice] = "error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private
  def list_params
      params.require(:book).permit(:title, :body)
  end

end
