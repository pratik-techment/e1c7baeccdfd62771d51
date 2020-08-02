class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
      @user = current_user
    	@micropost  = current_user.tweets.build
    	@feed_items = []
    	# @feed_items = current_user.feed
  	end
  end
end
