Rails.application.routes.draw do
  get 'feed', to: "epicenter#feed"
  get 'show_user', to: "epicenter#show_user"
  get 'now_following', to: "epicenter#now_following"
  get 'unfollow', to: "epicenter#unfollow"  

  resources :tweets
  devise_for :users
  root 'epicenter#feed'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
