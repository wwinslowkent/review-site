class UsersController < ApplicationController

  def index
    if admin_signed_in?
      @users = User.all
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to root_path
    end
  end

  def destroy
    if admin_signed_in?
      Reviews.where(user_id: params[:id]).delete_all
      User.where(id: params[:id]).delete_all
      redirect_to admins_path
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to root_path
    end
  end
end
