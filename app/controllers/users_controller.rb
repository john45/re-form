class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
    else
      render :edit
    end
  end

  def user_params
    # params.permit(:username, :password, :email, :password_confirmation)
    params.require(:user).permit(:username, :password, :email)
  end
end
