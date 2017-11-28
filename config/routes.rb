Rails.application.routes.draw do

  devise_for :users

  root "tweet#index"

  get "/timeline" => "tweet#timeline", as: :timeline

  get "/users" => "user#index", as: :tweet_users

  get "/users/:id" => "user#show", as: :user

  get "/users/follow/:id" => "user#follow", as: :follow_user

  get "/users/unfollow/:id" => "user#unfollow", as: :unfollow_user

  post "/tweet/create" => "tweet#create", as: :create_tweet

end
