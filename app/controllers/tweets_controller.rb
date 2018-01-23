class TweetsController < ApplicationController

  respond_to :js, :html

  def create
    @user = current_user
    @tweet = @user.tweets.build(tweet_params)
    @tweet.save_with_tags
    if @tweet.save_with_tags
      flash[:notice] = 'Tweet created!'
      redirect_to authenticated_root_path
    else
      flash[:notice] = 'ERROR! Tweet was not created :{'
      redirect_to authenticated_root_path
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:notice] = 'Tweet deleted!'
    redirect_to authenticated_root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

end
