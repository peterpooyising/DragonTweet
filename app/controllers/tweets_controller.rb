class TweetsController < ApplicationController

  def create
    @user = current_user
    @tweet = @user.tweets.build(tweet_params)
    if tweet.save
      redirect_to authenticated_root_path
    else
      redirect_to
    end
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
