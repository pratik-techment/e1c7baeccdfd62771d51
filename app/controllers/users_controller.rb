class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
    @followers = @user.followers.map(&:email)
    @following = @user.following.map(&:email)
    profile_data = {followers: @followers,following: @following }
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url }
      format.json { render json: profile_data }
    end
  end
end
