Rails.application.routes.draw do
  get 'feed', to: "epicenter#feed"
  get 'show_user', to: "epicenter#show_user"
  get 'now_following', to: "epicenter#now_following"
  get 'unfollow', to: "epicenter#unfollow"  
  get 'tag_tweets', to: "epicenter#tag_tweets"
  get 'all_users', to: "epicenter#all_users"
  # THis is going to show all the user followers 
  get 'followers', to: "epicenter#followers"
  get "followings", to: "epicenter#followings"
  resources :tweets
  devise_for :users
  root 'epicenter#feed'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
