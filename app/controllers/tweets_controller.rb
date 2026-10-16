class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(
      message: params[:tweet][:message],
      user: User.first   # 仮：ログイン機能を作ったら差し替える
    )
    if @tweet.save
      redirect_to tweets_path
    else
      @tweets = Tweet.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    Tweet.find(params[:id]).destroy
    redirect_to tweets_path
  end
end
