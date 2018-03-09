class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user)
    else
      flash.now[:errors] = ['Failed to create user']
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] = ['Something went wrong']
    end
  end


  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
