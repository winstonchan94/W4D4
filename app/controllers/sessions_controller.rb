class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login_user!(user)
    else
      flash[:errors] = ['Failed to log in']
      @email = params[:user][:email]
      render :new
    end
  end

  def destroy
    user = current_user
    if user
      user.reset_session_token!
      session[:session_token] = nil
      flash[:success] = 'Successfully logged out'
    else
      flash[:errors] = ['Logout failed due to unforeseen complications']
    end
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
