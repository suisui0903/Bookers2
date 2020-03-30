class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @users = User.all
  	@book = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    if current_user !=  @user
      redirect_to user_path(current_user)
    end
  end

  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def update
        user = User.find(params[:id])
        if user.update(list_params)
          redirect_to user_path(user.id),notice: " successfully update."
        else
          @user = User.find(params[:id])
          flash[:notice] = "error"
          render :edit
        end
    end

  private
  def list_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
