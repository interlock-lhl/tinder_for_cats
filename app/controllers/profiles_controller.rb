class ProfilesController < ApplicationController

  def show
    @profile = current_user.profile || Profile.new
  end

  def new
    @profile = current_user.profile || Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to user_profile_path
    else
      flash[:notice] = "Nope"
      render 'new'
    end
  end

  def edit
    @profile = current_user.profile || Profile.new
  end

  private

  def profile_params
    params.require(:profile).permit(:breed, :yob, :image_url, :favorite_nap_position, :purr_intensity, :in_to_head_butts)
  end
end
