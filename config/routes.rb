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


  get '/user/:username/followings', to: 'pages#followings', as: 'user_followings'
  get '/user/:username/followers', to: 'pages#followers', as: 'user_followers'
  get '/user/:username/tweets', to: 'pages#tweets', as: 'user_tweets'
  get 'tag/:id/tweets', to: 'pages#tweets_by_tag', as: 'tweets_by_tag'


  put '/update_avatar', to: 'users#update_avatar'
=begin
  PUT is used for updating an existing resource
  POST is used for creating a new resource
  In rails 4, PUT has been changed to PATCH to avoid confusion.
=end
  post '/follow/:id', to: 'users#follow', as: 'follow'
  delete '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'



  # resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create, :destroy]

end
