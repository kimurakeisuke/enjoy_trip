Rails.application.routes.draw do
  root "travels#index"
  devise_for :users
  resources :travels

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
