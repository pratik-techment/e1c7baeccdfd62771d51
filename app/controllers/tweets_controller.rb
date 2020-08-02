class TweetsController < ApplicationController

	def create
    user = User.find(params[:user_id])
    @tweet = user.tweets.build(tweet_params)
    if @tweet.save
      flash[:success] = "Tweet created!"
      respond_to do |format|
        format.html { redirect_back fallback_location: root_url }
        format.json { render json: @tweet }
      end
    else
      respond_to do |format|
        format.html { redirect_back fallback_location: root_url }
        format.json { { error: 'unable to create'} }
      end
    end
  end

	private

	  def tweet_params
  	  params.require(:tweet).permit(:content)
    end
end
