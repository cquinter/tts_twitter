Rails.application.routes.draw do

  devise_for :users

  root "user#redirect_to_timeline"

  get "/timeline" => "tweet#timeline", as: :timeline

  get "/users" => "user#index", as: :tweet_users

  get "/users/:id" => "user#show", as: :user

  # get "/users/profile" => "user#profile"

  get "/users/follow/:id" => "user#follow", as: :follow_user

  get "/users/unfollow/:id" => "user#unfollow", as: :unfollow_user

  post "/tweet/create" => "tweet#create", as: :create_tweet

  delete "/tweet/delete/:id" => "tweet#delete", as: :delete_tweet

end
