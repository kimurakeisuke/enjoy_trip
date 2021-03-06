Rails.application.routes.draw do
  root to: "travels#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
  devise_scope :user do
    post "/users/guest_sign_in", to: "users/sessions#new_guest"
  end
  resources :travels do
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
