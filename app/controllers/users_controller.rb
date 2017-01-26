class UsersController < ApplicationController

  def index
    if admin_signed_in?
      @users = User.all
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
  end

  def show
    if user_signed_in? && (User.find(params[:id]) == current_user)
      @user = User.find(params[:id])
      @reviews = Review.where(user: @user)
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to games_path
    end
  end

  def destroy
    if admin_signed_in?
      @user = User.find(params[:id])
      UserMailer.delete_user(@user).deliver_now
      Review.where(user_id: params[:id]).delete_all
      User.where(id: params[:id]).delete_all
      redirect_to users_path
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to new_admin_session_path
    end
  end

  def preview
    if user_signed_in? && (User.find(params[:id]) == current_user)
      @user = User.find(params[:id])
      if @user.profile_photo
        @user.remove_profile_photo!
        @user.save
        flash[:notice] = 'Profile picture removed.'
        redirect_to user_path(@user)
      end
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_to games_path
    end
  end
end
