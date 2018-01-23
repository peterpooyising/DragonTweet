class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:signout]
  # Rmb to exlude the "signout" method from "authenticate_user!" method or else the sign out page will not be rendered after user signs out, because the user will have to login again in order to see the sign out page.

  def home
    @tweets = @
  end

  def signout
  end

  private

  def prepare_user
    @user = params[:username] ? User.find_by(username: params[:username]) : current_user.email  # find the User by his/her username and assign the username to "@user" variable. If no username is found, assign the user's email to "@user" variable.
  end

end
