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
    @user = User.find(params[:id])
  end

  def now_following
    #You have to push as an integer because on the show_user page it is searching for if the current_user includes? (@user.id)
    #@ user.id is an integer 
    current_user.following.push(params[:id].to_i) #This is yourself 
    current_user.save
    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save 
    redirect_to show_user_path(id: params[:id])
  end


  def tag_tweets
    @tag = Tag.find(params[:tag_id])
  end

  def all_users
    @users = User.all
  end
  
  #Followers are going to show the followers of a certain user 
  #That user is going to be called @user 
  #We are trying to iterate through all the users and is if they have @user.id in their following array  
  def followers 
    @user = User.find(params[:id])
    @users = []
    User.all.each do |person| 
      if person.following.include?(@user.id)
        @users.push(person)
      end
    end
  end

  #Followings are going to show us the followings of a certain user 
  # @user is the owner of the page 
  #What we are trying to do is iterate through each user and check if our main @user has their id inside our following array 
  def followings 
    @user = User.find(params[:id])
    @users = []
    #I want to check if @user following array has the person id in it 
    #If the person's id is in @user.following than that person must be following @user
    User.all.each do |person| 
      #If this is true we want to push it into @users to iterate through it in the view page 
      if @user.following.include?(person.id)
        @users.push(person)
      end
    end
  end


end
