class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    @book = Book.new
    @users = User.all
  end

  def create
    @user_image = User.new(user_params)
    @user_image.user_id = current_user.id
    if @user_image.save
      redirect_to user_path
    else
      render :new
    end
  end

  def show
    @user_image = User.find(params[:id])
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path, notice: 'Updated your information!'
  end

  def destroy
    @user_image = User.find(params[:id])
    @user_image.destroy
    redirect_to user_images_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :profile_image, :intro)
    end
end