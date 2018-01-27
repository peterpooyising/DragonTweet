class UsersController < ApplicationController

  before_action :prepare_user
  before_action :prepare_followee, only: [:follow, :unfollow]

  def update_avatar
    @user.update(avatar: avatar)
    flash[:notice] = 'Avatar updated!'
    redirect_back fallback_location: authenticated_root_path
  end

  def follow
    @user.follow(@followee)   # @followee : the person whom current_user is tracking.
    # Followee:   a person who is BEING TRACKED on a social media website or application.
    flash[:notice] = "You followed " + @followee.username + " !"
    redirect_back fallback_location: authenticated_root_path
  end

  def unfollow
    @user.unfollow(@followee) # @followee : the person whom current_user is tracking.
    # Followee:   a person who is BEING TRACKED on a social media website or application.
    flash[:notice] = "You unfollowed " + @followee.username + " !"
    redirect_back fallback_location: authenticated_root_path
  end


  private

  def prepare_user
    @user = current_user
  end

  def prepare_followee
    @followee = User.find(params[:id])
  end

  def avatar
    params.require(:avatar)
  end

end

# ================================================== Notes ===================================================================
=begin

redirect_back method

  redirect_back(fallback_location:, **args) Link

  Redirects the browser to the page that issued the request (the referrer) if possible, otherwise redirects to the provided default fallback location.

  The referrer information is pulled from the HTTP `Referer` (sic) header on the request. This is an optional header and its presence on the request is subject to browser security settings and user preferences. If the request is missing this header, the fallback_location will be used.

  redirect_back fallback_location: { action: "show", id: 5 }
  redirect_back fallback_location: @post
  redirect_back fallback_location: "http://www.rubyonrails.org"
  redirect_back fallback_location: "/images/screenshot.jpg"
  redirect_back fallback_location: posts_url
  redirect_back fallback_location: proc { edit_post_url(@post) }
  All options that can be passed to redirect_to are accepted as options and the behavior is identical.

=end
