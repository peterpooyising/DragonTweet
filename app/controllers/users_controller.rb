class UsersController < ApplicationController

  before_action :prepare_user

  def update_avatar
    @user.update(avatar: avatar)
    flash[:notice] = 'Avatar updated!'
    redirect_to authenticated_root_path
  end

  def update_jobtitle
    @user.update(jobtitle: jobtitle)
    flash[:notice] = 'Job title updated!'
    redirect_to authenticated_root_path
  end

  def update_biography
    @user.update(biography: biography)
    flash[:notice] = 'Biography updated!'
    redirect_to authenticated_root_path
  end

  def update_quote
    @user.update(avatar: avatar)
    flash[:notice] = 'Favourite quote updated!'
    redirect_to authenticated_root_path
  end

  def update_facebook
    @user.update(facebook: facebook)
    flash[:notice] = 'Facebook account updated!'
    redirect_to authenticated_root_path
  end

  def update_instagram
    @user.update(instagram: instagram)
    flash[:notice] = 'Instagram account updated!'
    redirect_to authenticated_root_path
  end

  def update_email
    @user.update(email: email)
    flash[:notice] = 'Email address updated!'
    redirect_to authenticated_root_path
  end

  private

  def prepare_user
    @user = current_user
  end

  def avatar
    params.require(:avatar)
  end

  def book_params
    params.require(:book).permit(:name, :image, :remove_image)
  end

end
