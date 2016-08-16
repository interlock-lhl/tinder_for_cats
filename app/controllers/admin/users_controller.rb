class Admin::UsersController < ApplicationController

  before_action do
    if current_user.id != 1
      flash[:notice] = "No Admin for you! RAWR!"
      redirect_to '/'
    end
  end

  def index
    @users = User.all
  end

end
