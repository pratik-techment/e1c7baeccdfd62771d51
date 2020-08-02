Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users
  # , controllers: { sessions: :sessions },
  #                  path_names: { sign_in: :login }

  resources :users, defaults: {format: :json} do
      resources :tweets
      resources :relationships, only: [:create, :destroy]
  end
end
