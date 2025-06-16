class TweetsController < ApplicationController
  def index
    limit = params[:limit]&.to_i || 10
    tweets = Tweet.order(created_at: :desc).limit(limit)

    if params[:user_id]
      user = User.find(params[:user_id])
      tweets = user.tweets.order(created_at: :desc).limit(limit)
    end

    if params[:after]
      tweets = tweets.where('created_at < ?', Time.parse(params[:after]))
    end

    render json: tweets

  end
end
