Rails.application.routes.draw do

  devise_for :users
  root to: "items#index"

  resources :items do
    resources :purchase, only: [:index, :new, :create]
  end
  
end
