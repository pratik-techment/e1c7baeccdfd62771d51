Rails.application.routes.draw do

  root 'static_pages#home'

  devise_for :users
  # , controllers: { sessions: :sessions },
  #                  path_names: { sign_in: :login }

  resources :users, defaults: {format: :json} do
      member do
        get :profile, :feed
      end
      resources :tweets
      resources :relationships, only: [:create, :destroy]
  end
end
