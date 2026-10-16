class LikesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by(uid: session[:login_uid])
    if user && !user.like_tweets.include?(tweet)
      user.like_tweets << tweet
    end
    redirect_to root_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by(uid: session[:login_uid])
    if user
      like = tweet.likes.find_by(user_id: user.id)
      like.destroy if like
    end
    redirect_to root_path
  end
end