Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  resources :users do
      resources :tweets
  end
end
