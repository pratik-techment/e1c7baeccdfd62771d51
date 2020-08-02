class RelationshipsController < ApplicationController

  def create
		set_current_user
    @follow_user = User.find(params[:followed_id])
    unless @user.following?(@follow_user)
      @user.follow(@follow_user)
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: { message: 'success' } }
      end
    else
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: {error: "Already following"} }
      end
    end
  end

  def destroy
    set_current_user
    @follow_user = User.find(params[:followed_id])
    @user.unfollow(@follow_user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { render json: { message: 'success' }.to_json }
    end
  end

  private

  def set_current_user
    @user = User.find(params[:user_id])
  end
end
