class UsersController < ApplicationController

  before_action :prepare_user

  def update_avatar
    @user.update(avatar: avatar)
    flash[:notice] = 'Avatar updated!'
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
