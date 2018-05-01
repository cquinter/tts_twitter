class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tweet = Tweet.new
  end

  # def profile
  #   @user = current_user
  #   @tweets = Tweet.where(user_id: current_user.following.push(current_user.id))
  #   @tweet = Tweet.new
  # end

  def follow
    current_user.following.push(params[:id])
    current_user.save!
    redirect_to user_url(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id])
    current_user.save!
    redirect_to user_url(id: params[:id])
  end

  def redirect_to_timeline
    redirect_to timeline_url
  end

end
