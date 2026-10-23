class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    user = current_user
    if user.nil?
      redirect_to root_path, alert: "ログインしてください"
      return
    end

    tweet = Tweet.new(message: params[:tweet][:message], user: user)
    if tweet.save
      redirect_to root_path
    else
      redirect_to root_path, alert: "メッセージを入力してください"
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to root_path
  end
end
