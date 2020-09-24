Rails.application.routes.draw do
  root to: "travels#index"
  devise_for :users
  resources :travels do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
