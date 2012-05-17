class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
    @follow_tweets = Array.new
    User.find(current_user.id).follows.each do |follow|
      Twitt.where(:user_id => follow.following_id).each do |tweet|
        @follow_tweets << tweet
      end
    end
  end

  def profile
    @my_tweets = Twitt.find_all_by_user_id(current_user.id)
  end

  def user_search
    keyword = params[:user_nick]
    keyword = "%" + keyword + "%"
    @users = User.where("nick like ? AND id <> ?",keyword, current_user.id)
  end

  def user_wall
    user_id = params[:user_id]
    if !params[:post].blank?
      tweet = Twitt.new(:post => "@" + current_user.nick + " " + params[:post], :user_id => user_id)
      tweet.save!
      redirect_to user_wall_path(user_id)
    else
      @user = User.find(user_id)
      @tweets = Twitt.find_all_by_user_id(user_id)
    end
  end

end
