Rails.application.routes.draw do

  # Devise Facebook Login & Overwriting Devise's default routes
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions"
  }

  # Redirect after sign in
  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end

  # Root page
  root to: redirect('/users/sign_in')

  # Sign out page
  get '/signout', to: 'pages#signout', as: 'user_signout'


  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create, :destroy]

  # get 'user/:username/following', to: 'pages#following', as: 'user_following'
  # get 'user/:username/follower', to: 'pages#follower', as: 'user_follower'
  # get 'user/:username/tweets', to: 'pages#tweets', as: 'user_tweets'
  # get 'tag/:id/tweets', to: 'pages#tweets_by_tag', as: 'tweets_by_tag'

  # root to: 'pages#home'

  # authenticated :user do
  #   root to: 'pages#home', as: :authenticated_root
  # end
  # root to: redirect('/users/sign_in')
  # get 'user/:username/following', to: 'pages#following', as: 'user_following'
  # get 'user/:username/follower', to: 'pages#follower', as: 'user_follower'
  # get 'user/:username/tweets', to: 'pages#tweets', as: 'user_tweets'
  # get 'tag/:id/tweets', to: 'pages#tweets_by_tag', as: 'tweets_by_tag'
  # get 'search', to: 'pages#search'
  #
  # put '/update_avatar', to: 'users#update_avatar'
  # post '/follow/:id', to: 'users#follow', as: 'follow'
  # delete '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'
  #
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # resources :tweets, only: [:create, :destroy]

end
