class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find(user_params)
  end

  def create
    @user = User.new(user_params)
    if user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def index
    @user = User.all
  end

  def show
  end


  def destroy

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :id)
  end

end
