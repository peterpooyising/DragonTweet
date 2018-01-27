class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:signout]
  # Rmb to exlude the "signout" method from "authenticate_user!" method or else the sign out page will not be rendered after user signs out, because the user will have to login again in order to see the sign out page.

  before_action :prepare_user, only: [:tweets, :followings, :followers]
  before_action :prepare_current_user, only: [:home, :tweets_by_tag]

  # This is the current_user HOME page. It will show the tweets of the all the users that current_user follow as well as his own tweet.
  def home
    @tweets = @user.feed
  end

  # This is the page of all other USER. It will show the tweets of the particular user that current_user clicked on only.
  def tweets
    @tweets = @user.tweets.order(created_at: :desc) # order OWN tweets according to when they were created, with the most recent tweet at the top.
    respond_to do |format|
      format.html
      format.js
    end
  end

  # This is the page of the particular user that current_user clicked on for that user's "Following" in that user's profile card. It will show all the people which that particular user followed.
  def followings
    @followees = @user.followees.order(created_at: :desc) # order the followings(the people that current_user follows) according to when they were followed by current_user, with the most recent following at the top.
  end

  # This is the page of the particular user that current_user clicked on for that user's "Followers" in that user's profile card. It will show all the people that followed that particular user.
  def followers
    @followers = @user.followers.order(created_at: :desc) # order the followers(the people that follows current_user) according to when they follow current_user, with the most recent follower at the top.
  end

  # This method is to find all the Tweets that are associated with a particular Tag.
  def tweets_by_tag
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.order(created_at: :desc)  # order the tweets according to when they were created, with the most recent tweet at the top.
  end

  # ==================================== To be continued ==============================================================
  def search
  end

  def tutorial
    @tutorial = true
    # this method is just to render the tutorial page only
  end

  def signout
    # this method is just to render sign out page only
  end

  private

  def prepare_user
    @user = params[:username] ? User.find_by(username: params[:username]) : current_user  # find the User by his/her username and assign the username to "@user" variable. If no username is found, assign the user's email to "@user" variable.
  end

  def prepare_current_user
    @user = current_user
  end

  def prepare_search_term
  end

end
