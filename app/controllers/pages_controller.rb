class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:signout]
  # Rmb to exlude the "signout" method from "authenticate_user!" method or else the sign out page will not be rendered after user signs out, because the user will have to login again in order to see the sign out page.

  def home
  end

  def signout
  end

end
