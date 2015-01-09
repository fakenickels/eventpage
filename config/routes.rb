Rails.application.routes.draw do
  resources :speakers

  root "home#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :courses
  resources :events
end
