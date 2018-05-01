class TweetController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
  end

  def timeline
    ids = current_user.following
    ids.push(current_user.id.to_s)
    ids.each do |id|
      if User.find_by(id: id.to_i) == nil
        ids.delete(id)
      end
    end
    @tweets = Tweet.where(user_id: ids).order(created_at: :desc)
  end

  def create
   tweet = current_user.tweets.create(tweet_params)
   tweet.save!
   redirect_to user_path(id: current_user.id)
  end

  def delete
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to user_path(id: current_user.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:message)
  end

end
