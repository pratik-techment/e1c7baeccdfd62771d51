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

  def feed
    @user = User.find(params[:id])
    @feed = @user.feed(params[:sort_type])
    feed_data = @feed.map do |feed|
      {content: feed.content, author_id: feed.user}
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url }
      format.json { render json: feed_data }
    end
  end
end
