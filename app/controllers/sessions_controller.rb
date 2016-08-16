class SessionsController < ApplicationController

  def create
    if user = User.find_by(email: user_params[:email]).try(:authenticate, user_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome... purrrrr"
      redirect_to '/'
    else
      flash[:notice] = "Failed to login, try again or have a nap"
      @user = User.new
      render 'show'
    end
  end

  def show
    @user = User.new
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "Hisss!"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
