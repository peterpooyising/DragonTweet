class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:signout]
  # Rmb to exlude the "signout" method from "authenticate_user!" method or else the sign out page will not be rendered after user signs out, because the user will have to login again in order to see the sign out page.

  # before_action :prepare_user, only: []
  before_action :prepare_user, only: [:tweets, :following, :follower]
  before_action :prepare_current_user, only: [:home, :tweets_by_tag]


  def home
    @tweets = @user.feed
    tag = Tag
  end

  def tweets
    @tweets = @user.tweets.order(created_at: :desc) # order OWN tweets according to when they were created, with the most recent tweet at the top.
    respond_to do |format|
      format.html
      format.js
    end
  end

  def followings
    @followees = @user.followees.order(created_at: :desc) # order the followings(the people that current_user follows) according to when they were followed by current_user, with the most recent following at the top.
  end

  def followers
    @followers = @user.followers.order(created_at: :desc) # order the followers(the people that follows current_user) according to when they follow current_user, with the most recent follower at the top.
  end

  # This method is to find all the Tweets that are associated with a particular Tag.
  def tweets_by_tag
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets.order(created_at: :desc)  # order the tweets according to when they were created, with the most recent tweet at the top.
  end

  def search
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


end
