class EpicenterController < ApplicationController
  def feed
    #This include tweeets from people we follow and our own tweets 
    @following_tweet = []
    Tweet.all.each do |tweet| 
      if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id 
        @following_tweet.push(tweet)
      end
    end

  end

  def show_user
  end

  def now_following
  end

  def unfollow
  end
end
